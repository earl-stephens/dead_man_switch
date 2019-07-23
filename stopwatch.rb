class Stopwatch
  attr_reader :updated_at,
              :user_id,
              :interval_in_seconds

  def initialize(updated_at, user_id, interval_in_seconds)
    @updated_at = updated_at
    @user_id = user_id
    @interval_in_seconds = interval_in_seconds
  end

  def dead_mans_switch
    current_time = Time.now.to_i
    time_difference = (@updated_at.to_i + @interval_in_seconds.to_i) - current_time
    format_time(time_difference, user_id)
  end

  def format_time(time_diff, user_id)
    data = { "time_difference": "#{time_diff}", "user_id": "#{user_id}"}
  end

end
