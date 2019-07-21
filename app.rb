require './stopwatch'
class Timer < Sinatra::Base
  attr_reader :latest_time

  put '/timer' do
    # "hello world"
    request.body.rewind
    @latest_time = JSON.parse([request.body.read].to_json)
    sw = Stopwatch.new(@latest_time)
    sw.find_diff
  end
  # #
  # get '/display_time' do
  #   # binding.pry
  #   "hello"
  # end

end
