require './stopwatch'
require 'json'

class Timer < Sinatra::Base

  get '/timer2.json' do
    request.body.rewind
    initial_results = JSON.parse([request.body.read].to_json)
    results = JSON.parse(initial_results.first)
    user_id = results["user_id"]
    updated_at = results["updated_at"]
    interval_in_seconds = results["interval"]
    sw = Stopwatch.new(updated_at, user_id, interval_in_seconds)
    time_data = sw.dead_mans_switch
    content_type :json
    {:time_difference => "#{time_data[:time_difference]}", :user_id => "#{time_data[:user_id]}" }.to_json
  end
end
