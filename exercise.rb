#!/usr/bin/env ruby

CENTRURIAL_LEAP_YEAR = 1600
NORMAL_DAYS_PER_MONTH = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ]
LEAP_YEAR_DAYS_PER_MONTH = [ 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ]

public
def get_days_per_month_of_year(year)
  return LEAP_YEAR_DAYS_PER_MONTH if leap_year?(year)

  NORMAL_DAYS_PER_MONTH
end

def calculate_dates_diff_in_days(start_date, end_date)
  total_days = 0

  (start_date.year..end_date.year).each do |year|
    days_of_year = get_days_per_month_of_year(year)

    if year == start_date.year || year == end_date.year
      start_month_index = 0 if year != start_date.year else start_date.month - 1
      end_month_index = 11 if year != end_date.year else end_date.month - 1

      total_days += days_of_year[start_month_index] - start_date.day
      total_days += days_of_year[end_month_index] - end_date.day

      remaining_months_range = start_date.month...end_month_index
      remaining_months_range.each do |month_index|
        total_days += days_of_year[month_index]
      end
    else
      days_of_year.each { |days| total_days += days }
    end
  end

  total_days
end

def leap_year?(year)
  diff = LEAP_YEAR - year

  return false if diff / 4 != 0
  return false if diff / 100 == 0 && diff / 400 != 0 # special centurial year rule

  true
end

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


