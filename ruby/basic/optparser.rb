require 'rubygems'
require 'optparser'



opt = OptionParser.new do |o|
  o.banner = "this is banner of file"

  o.separator "======== seprator one =========="
  o.on("-h","--help","help system") do
    puts "this is result of switch -h"
  end

  o.on("-v","--version","version system") do
    puts "version"
  end

  o.on_tail("-u") do
    puts o
  end


end

opt.parse! ARGV
