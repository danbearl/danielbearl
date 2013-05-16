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
      | Title | the first post       |
      | Body  | This is so much fun! |
    And I press "Create Post"
    Then I should see "Post successfully created."
    And I should see "This is so much fun!"

  Scenario: Edit a blog post
    Given the following post:
      | title | Post      |
      | body  | Post Body |
    And I am on the blog page
    When I follow "Edit"
    And I fill in the following:
      | Body | New content |
    And I press "Update Post"
    Then I should see "Post successfully updated."
    And I should see "New content"

  Scenario: Delete a blog post
    Given the following post:
      | title | Post      |
      | body  | Post Body |
    And I am on the blog page
    When I follow "Delete"
    Then I should see "Post successfully deleted."
    And I should not see "Post Body"
