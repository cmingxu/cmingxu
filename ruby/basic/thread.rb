require 'thread'

t1 = Thread.new do
  loop do
    print "*"
    STDOUT.flush
    sleep rand(2)
  end
end



t2 = Thread.new do
  loop do
    print "1"
    STDOUT.flush
    sleep rand(2)
  end
end


trap("INT") do
  puts Thread.current
  exit
end



t1.join
t2.join
