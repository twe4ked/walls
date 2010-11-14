Given /^I have a wall named "([^"]*)" with a slug of "([^"]*)"$/ do |title, slug|
  Given "I am on the new wall page"
  When %Q[I fill in "Title" with "#{title}"]
  Then %Q[I fill in "Slug" with "#{slug}"]
  Then %Q[I fill in "Description" with "Description for #{title}"]
  Then %Q[I press "Create Wall"]
  Then %Q[I should see "Wall was successfully created"]
end
