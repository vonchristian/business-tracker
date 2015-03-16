
 set :output, "#{path}/log/cron.log"

every :reboot do
  command "rails server -e production -b 192.168.1.100 -p 4000"
end

every 1.month, :at => "start of the month at 10am" do
  runner "Business.update_status_of_police_clearances"

end

