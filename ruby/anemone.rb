require 'rubygems'
require 'anemone'


url =  "http://bbs.linux.org"

Anemone.crawl(url) do |anemone|
  anemone.on_every_page do |page|
    puts page.url
  end
end



