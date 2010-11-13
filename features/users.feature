Feature: User registration
  
  Scenario Outline: Creating a new account
    Given I am not authenticated
    When I go to the new user registration page
    And I fill in "user_email" with "<email>"
    And I fill in "user_password" with "<password>"
    And I fill in "user_password_confirmation" with "<password>"
    And I press "Sign up"
    Then I should see "You have signed up successfully"
  
    Examples:
      | email           | password   |
      | testing@man.net | secretpass |
      | foo@bar.com     | fr33z3     |
  
  Scenario: Logging in as a user
    Given I am a new, authenticated user
    Then I should be on the home page
    And I should see "test" within "header"
