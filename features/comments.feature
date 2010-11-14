Feature: Comments
  
  Scenario: Posting a new comment on a status update
    Given I am a new, authenticated user
    And I have a wall named "Foo Bar" with a slug of "foobar"
    Then I should be on the "foobar" wall page
    Then I post "Hello world" as a status update
    Then I should be on the "foobar" wall page
    And I should see "Hello world"
    Then I post "Hello world, hello" as a comment on "Hello world"
    Then I should be on the "foobar" wall page
    And I should see "Hello world, hello" within "li.comment"

  @javascript
  Scenario: Posting a new comment via the "Add comment" link
    Given I am a new, authenticated user
    And I have a wall named "Foo Bar" with a slug of "foobar"
    Then I should be on the "foobar" wall page
    Then I post "Hello world" as a status update
    Then I should be on the "foobar" wall page
    And I should see "Hello world"
    Then I post "Hello world, hello" using Javascript as a comment on "Hello world"
    Then I should be on the "foobar" wall page
    And I should see "Hello world, hello" within "li.comment"
