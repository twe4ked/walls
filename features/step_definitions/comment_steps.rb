Then /^I post "([^"]*)" (using Javascript )?as a comment on "([^"]*)"$/ do |comment_message, js, status_message|
  status = Status.find_by_content status_message
  Given "I am on the home page"
  Then %Q[I follow "Add comment" within "##{dom_id status}"] unless js.blank?
  When %Q[I fill in "comment_content" with "#{comment_message}" within "##{dom_id status}"]
  And %Q[I press "Post Comment" within "##{dom_id status}"]
  Then %Q[I should see "Comment was successfully created"]
end
