Then /^I post "([^"]*)" as a comment on a status update$/ do |message|
  Given "I am on the home page"
  When %Q[I fill in "comment_content" with "#{message}"]
  And %Q[I press "Post"]
  Then %Q[I should see "Comment was successfully created"]
end
