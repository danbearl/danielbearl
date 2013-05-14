Feature: Visit a page
  Background: Some pages exist
    Given the following pages:
      | name | body           |
      | Home | Home page text |
      | Info | Info page text |

  Scenario: Admin tools are hidden
    Given I am on the home page
    When I follow "Info"
    Then I should not see "Edit"
