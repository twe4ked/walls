Feature: Walls
  
  Scenario: Creating a new wall
    Given I am a new, authenticated user
    And I am on the new wall page
    Then I should see "Make a new wall" within "h2"
    Then I fill in "Title" with "Foo Bar"
    Then I fill in "Slug" with "fubar"
    Then I fill in "Description" with "This is where we come to talk foo bar"
    Then I press "Create Wall"
    Then I should be on the "fubar" wall page