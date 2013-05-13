Feature: User
  Background:
    Given the following user:
      | email                 | dan@example.com |
      | password              | pass            |
      | password_confirmation | pass            |

  Scenario: User logs in
    Given I am on the log in page
    When I fill in the following:
      | Email    | dan@example.com |
      | Password | pass            |
    And I press "Log In"
    Then I should see "Successfully logged in."

  Scenario: User logs out
    Given that user is logged in
    And I am on the home page
    When I follow "Log Out"
    Then I should see "Successfully logged out."
