require 'timeout'
begin
Timeout.timeout 3 do
  sleep 10
end

rescue Timeout::Error
  puts 'haha'
ensure 
  puts 'finally'
end
