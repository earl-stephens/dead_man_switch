require './stopwatch'
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
    sw = Stopwatch.new(@latest_time)
    sw.find_diff
  end

  get '/display_time' do
    data = {"sinatra_data": "1234567890"}
    data = data.to_json
    Faraday.put('http://127.0.0.1:3000/receiver') do |f|
              f.body =  data
              f.headers["Content-Type"] = "application/json"
              f.headers["Content-Length"] = "16"
              end
  end

end
