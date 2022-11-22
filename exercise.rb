#!/usr/bin/env ruby

CENTRURIAL_LEAP_YEAR = 1600
NORMAL_DAYS_PER_MONTH = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ]
LEAP_YEAR_DAYS_PER_MONTH = [ 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ]

public
def leap_year?(year)
  diff = CENTRURIAL_LEAP_YEAR - year

  return false if diff / 4 != 0
  return false if diff / 100 == 0 && diff / 400 != 0 # special centurial year rule

  true
end

def get_days_per_month_of_year(year)
  return LEAP_YEAR_DAYS_PER_MONTH if leap_year?(year)

  NORMAL_DAYS_PER_MONTH
end

def calculate_diff_in_days_between_dates(start_date, end_date)
  total_days = 0

  (start_date[:year]..end_date[:year]).each do |year|
    days_of_year = get_days_per_month_of_year(year)

    if year == start_date[:year] || year == end_date[:year]
      start_month_index = if year != start_date[:year] then 0 else start_date[:month] - 1 end
      end_month_index = if year != end_date[:year] then 11 else end_date[:month] - 1 end

      if start_month_index == end_month_index
        total_days += ((start_date[:day] + 1)...end_date[:day]).count
      else
        total_days += ((start_date[:day] + 1)..days_of_year[start_month_index]).count
        total_days += (1...end_date[:day]).count
      end

      remaining_months_range = start_date[:month]...end_month_index
      remaining_months_range.each do |month_index|
        total_days += days_of_year[month_index]
      end
    else
      total_days += days_of_year.sum
    end
  end

  total_days
end

def parse_date(date)
  date_parts = date.split("/").map(&:to_i)

  {
    day: date_parts.first,
    month: date_parts[1],
    year: date_parts.last
  }
end

def parse_input(raw_input)
  dates = raw_input.split.map { |input| parse_date(input) }
  dates.sort_by { |date| [date[:year], date[:month], date[:day]] }
end

def invalid_input?(input)
  false
end


raw_input = STDIN.read

if (invalid_input?(raw_input))
  puts "invalid input"
  exit
end

dates = parse_input(raw_input)
start_date = dates.first
end_date = dates.last
days_diff = calculate_diff_in_days_between_dates(start_date, end_date)

puts "#{days_diff} days"
