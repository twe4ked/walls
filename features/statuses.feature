Feature: Statuses
  
  Scenario: Posting a new status update
    Given I am a new, authenticated user
    And I have a wall named "Foo Bar" with a slug of "foobar"
    Then I should be on the "foobar" wall page
    Then I post "Hello world" as a status update
    Then I should be on the "foobar" wall page
    And I should see "Hello world"
