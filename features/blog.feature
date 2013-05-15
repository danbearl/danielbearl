Feature: Blog
  Background: User is logged in
    Given the following user:
      | email                 | dan@example.com |
      | password              | pass            |
      | password_confirmation | pass            |
    And that user is logged in

  Scenario: Create a new blog post
    Given I am on the blog page
    When I follow "New Post"
    And I fill in the following:
      | title | the first post       |
      | body  | This is so much fun! |
    And I press "Create Post"
    Then I should see "Post successfully created."
    And I should see "This is so much fun!"
