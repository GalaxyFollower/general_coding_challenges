#Example input: times=["11:51pm", "11:56pm", "12:01am", "12:06am", "12:11am"]
require 'time'
SECONDS_IN_DAY = 86400
MIDNIGHT = Time.parse("12:00AM").to_i
MIDDAY = Time.parse("12:00PM").to_i

def averagetime(times)
    seconds = []
    times.each {|time| seconds << Time.parse(time).to_i}
    seconds.sort!
    if (seconds.first - MIDNIGHT) < (seconds.last - MIDDAY)
        seconds.map! {|s| s < MIDDAY ? s += SECONDS_IN_DAY : s }
    end
    Time.at(seconds.inject { |sum,n| sum += n }.to_f / seconds.length).strftime("%I:%M%p").downcase
end