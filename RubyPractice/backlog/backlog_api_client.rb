
require 'faraday'
require 'uri'
require 'json'
require 'pry'
require 'rubygems'
require 'active_support/all'

class BacklogApiClient
  def initialize(uri, api_key)
    @api_key = api_key
    @uri = uri
    @conn = Faraday::Connection.new(:url => @uri) do |builder|
      # builder.use Faraday::Request::UrlEncoded  # リクエストパラメータを URL エンコードする
      # builder.use Faraday::Response::Logger     # リクエストを標準出力に出力する
      builder.use Faraday::Adapter::NetHttp     # Net/HTTP をアダプターに使う
    end
  end

  def space
    JSON.parse(@conn.get('/api/v2/space', {apiKey: @api_key}).body)
  end

  def activities(interval = nil)
    activities = JSON.parse(@conn.get('/api/v2/space/activities', {apiKey: @api_key}).body)
    if interval
      activities.select! do |activity|
        puts activity["notifications"]
        DateTime.parse(activity["created"]).new_offset(9.0 / 24) >= DateTime.now - interval.minute
      end
    end
    activities
  end
end


client = BacklogApiClient.new('https://241241.backlog.jp', '2zdY8Foy8nZXu0q9XqSlhv5ioo7kC2Nd5CqCCg3XC0d0tjcc1GsHvDvJMWw2Kcel')

puts client.activities(10).to_json
