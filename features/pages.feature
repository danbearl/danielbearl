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
      | Name | About                  |
      | Body | This is the about page |
    And I press "Create Page"
    Then I should see "Page successfully created."
    And I should see "This is the about page"

  Scenario: Edit a page
    Given the following page:
      | name | About          |
      | body | The about page |
    And I am on that page
    When I follow "Edit"
    And I fill in the following:
      | Body | New body content |
    And I press "Update Page"
    Then I should see "Page successfully updated."
    And I should see "New body content"

  Scenario: Delete a page
    Given the following page:
      | name | About    |
      | body | The body |
    And I am on that page
    When I follow "Delete"
    Then I should see "Page successfully deleted."
    And I should not see "About"
