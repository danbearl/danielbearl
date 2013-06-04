Feature: Post Drafts

  Background: A user is logged in
    Given the following user:
      | email                 | dan@example.com |
      | password              | pass            |
      | password_confirmation | pass            |
    And that user is logged in
    And the following post:
      | title | A Post    |
      | body  | Some Text |
      | draft | true      |
  
  Scenario: Draft Posts do not appear on blog page
    Given I am on the blog page
    Then I should not see "A Post"

  Scenario: Draft Posts do appear on the staging page
    Given I am on the staging page
    Then I should see "A Post"
    
    

