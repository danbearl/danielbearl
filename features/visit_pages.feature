Feature: Visit a page
  Background: Some pages exist
    Given the following pages:
      | name | body           |
      | Home | Home page text |
      | Info | Info page text |

  Scenario: Page names show up in navigation
    Given I am on the home page
    Then I should see "Home"
    And I should see "Info"

  Scenario: Nav links to pages
    Given I am on the home page
    When I follow "Info"
    Then I should see "Info page text"

  Scenario: Admin tools are hidden
    Given I am on the home page
    When I follow "Info"
    Then I should not see "Edit"
