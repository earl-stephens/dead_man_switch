require './stopwatch'
require 'json'
# require 'faraday'
class Timer < Sinatra::Base
  attr_reader :latest_time

  get '/' do
    erb :welcome
  end

  put '/timer' do
    # "hello world"
    request.body.rewind
    @latest_time = JSON.parse([request.body.read].to_json)
    # binding.pry
    sw = Stopwatch.new(@latest_time)
    # sw.find_diff

    data = {"sinatra_data": "#{sw.find_diff}"}
    data = data.to_json
  # binding.pry
    Faraday.put('http://127.0.0.1:3000/receiver') do |f|
              f.body =  data
              f.headers["Content-Type"] = "application/json"
              f.headers["Content-Length"] = "16"
              end
  end

  get '/timer2.json' do
  # binding.pry
  request.body.rewind
  @latest_time = JSON.parse([request.body.read].to_json)
  # binding.pry
  sw = Stopwatch.new(@latest_time)
  # sw.find_diff
  # binding.pry
  content_type :json
  {:key1 => "#{sw.find_diff}"}.to_json

end

end
