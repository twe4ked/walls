Feature: Comments
  
  Scenario: Posting a new comment on a status update
    Given I am a new, authenticated user
    Then I post "Hello world" as a status update
    Then I should be on the home page
    And I should see "Hello world"
    Then I post "Hello world, hello" as a comment on a status update
    Then I should be on the home page
    And I should see "Hello world, hello" within "li.comment"
    