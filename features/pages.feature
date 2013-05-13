Feature: Pages
  Background: A user is logged in
    Given the following user:
      | email                 | dan@example.com |
      | password              | pass            |
      | password_confirmation | pass            |
    And that user is logged in

  Scenario: Create a new page
    Given I am on the new page view
    When I fill in the following:
      | Name | Home                  |
      | Body | This is the home page |
    And I press "Create Page"
    Then I should see "Page successfully created."
    And I should see "This is the home page"
