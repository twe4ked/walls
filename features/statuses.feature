Feature: Statuses
  
  Scenario: Posting a new status update
    Given I am a new, authenticated user
    Then I post "Hello world" as a status update
    Then I should be on the home page
    And I should see "Hello world"
