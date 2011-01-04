require 'rubygems'
require 'irb'
require 'irb/completion'

IRB.start

trap(INT) do
  $STDERR.puts "exit"
  exit
end
