Then /^I post "([^"]*)" as a comment on "([^"]*)"$/ do |comment_message, status_message|
  status = Status.find_by_content status_message
  Given "I am on the home page"
  When %Q[I fill in "comment_content" with "#{comment_message}" within "##{dom_id status}"]
  And %Q[I press "Post Comment" within "##{dom_id status}"]
  Then %Q[I should see "Comment was successfully created"]
end
