Feature: Tag Cloud
  Background:
    Given the following posts:
      | title  | body      | tags_list      |
      | post 1 | some text | happy, sad, ok |
      | post 2 | some text | happy, ok      |
      | post 3 | some text | happy          |

  Scenario: Tag cloud shows up on page
    Given I am on the blog page
    Then I should see "happy ok sad"
