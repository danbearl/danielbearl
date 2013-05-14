Feature: Site Navigation
  Background: Some pages exist 
    Given the following pages:
        | name | body           | priority |
        | Home | Home page text | 1        |
        | Info | Info page text | 2        |

  Scenario: Page names show up in navigation
    Given I am on the home page
    Then I should see "Home"
    And I should see "Info"

  Scenario: Nav links to pages
    Given I am on the home page
    When I follow "Info"
    Then I should see "Info page text"

  Scenario: Pages show up by order of priority
    Given I am on the home page
    Then I should see "Home Info"
    And I should not see "Info Home"
