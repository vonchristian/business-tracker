
 set :output, "#{path}/log/cron.log"

every :reboot do
  command "foreman start"
end

every 1.month, :at => "start of the month at 10am" do
  runner "Business.update_status_of_police_clearances"

end

