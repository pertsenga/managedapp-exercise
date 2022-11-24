result = `echo 2/6/1983 22/6/1983 | ruby exercise.rb`
puts result == "19 days\n"

result = `echo 4/7/1984 25/12/1984 | ruby exercise.rb`
puts result == "173 days\n"

result = `echo 3/1/1989 3/8/1983 | ruby exercise.rb`
puts result == "1979 days\n" # https://www.timeanddate.com/date/durationresult.html?d1=3&m1=8&y1=1983&d2=3&m2=1&y2=1989

result = `echo 01/01/2001 03/01/2001 | ruby exercise.rb`
puts result == "1 days\n"

result = `echo 1/1/2001 2/1/2001 | ruby exercise.rb`
puts result == "0 days\n"

result = `echo 1/1/2001 1/1/2001 | ruby exercise.rb`
puts result == "0 days\n"

result = `echo 1/1/2001 3/1/2001 | ruby exercise.rb`
puts result == "1 days\n"
