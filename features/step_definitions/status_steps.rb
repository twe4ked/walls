Then /^I post "([^"]*)" as a status update$/ do |message|
  When %Q[I fill in "status_content" with "#{message}"]
  And %Q[I press "Post Update"]
  Then %Q[I should see "Status was successfully created"]
end
