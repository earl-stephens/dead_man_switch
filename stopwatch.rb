# require './timer'
class Stopwatch
  attr_reader :latest_time

  def initialize(time)
    @latest_time = JSON.parse(time.first)["time_data"].to_i
  end

  def find_diff
    Time.now - @latest_time
  end

end
