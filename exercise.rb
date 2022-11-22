#!/usr/bin/env ruby

public
def parse_date(date)
  date_parts = date.split("/").map(&:to_i)

  {
    day: date_parts.first,
    month: date_parts[1],
    year: date_parts.last
  }
end

def invalid_input?(input)
  false
end


raw_input = STDIN.read

if (invalid_input?(raw_input))
  puts "invalid input"
  exit
end

dates = raw_input.split.map { |input| parse_date(input) }
start_date = dates.first
end_date = dates.last
