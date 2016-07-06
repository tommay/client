require "uri"
require "http"

class Client
  def initialize
    @clients = {}
  end

  def get(url)
    try_times(2) do
      response = begin
        really_get(url)
      rescue => ex
        raise "HTTP problem: #{url}: #{ex.inspect}"
      end

      if response.code != 200
        raise "HTTP problem: #{url}: #{response.status}"
      end

      response.to_s
    end
  end

  private

  def really_get(url)
    uri = url.is_a?(URI) ? url : URI.parse(url)
    base = uri.merge("/").to_s     # => "http://server/"

    try_times(2) do
      client = @clients[base]
      if !client
        puts "New for #{base}"
        client = HTTP.persistent(base)
        @clients[base] = client
      end
      begin
        client.get(url, follow: true)
      rescue => ex
        client.close
        @clients.delete(base)
        raise ex
      end
    end
  end

  def try_times(times, &block)
    begin
      block.call
    rescue => ex
      if times == 1
        raise ex
      end
      puts "Got #{ex.inspect}, retrying"
      try_times(times - 1, &block)
    end
  end
end

