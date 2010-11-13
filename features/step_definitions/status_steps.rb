Then /^I post "([^"]*)" as a status update$/ do |message|
  Given "I am on the home page"
  When %Q[I fill in "status_content" with "#{message}"]
  And %Q[I press "Post"]
  Then %Q[I should see "Status was successfully created"]
end
