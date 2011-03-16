print "%s\n" % "dddd"

at_exit{
  print "\n%s  at exit\n" %  "EXITING"
}

l = lambda do 
  puts "sssss"
end

p = proc do
  puts "Proc"
end

p.call
l.call

File.open(__FILE__) do |f|
  p f.readline
end
IO.foreach(__FILE__) do |line|
  p line
end

Spen::Runner.configure do |config|
  config.incldue(SSS)

end


