Feature: Walls
  
  Scenario: Creating a new wall
    Given I am a new, authenticated user
    And I have a wall named "Foo Bar" with a slug of "foobar"
    Then I should be on the "foobar" wall page