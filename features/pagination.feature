Feature: Pagination
  Scenario: Posts will paginate in batches of 10
    Given the following posts:
      | title    | body | draft |
      | First    | text | false |
      | Second   | text | false |
      | Third    | text | false |
      | Fourth   | text | false |
      | Fifth    | text | false |
      | Sixth    | text | false |
      | Seventh  | text | false |
      | Eighth   | text | false |
      | Ninth    | text | false |
      | Tenth    | text | false |
      | Eleventh | text | false |
    And I am on the blog page
    Then I should not see "First"
    And I should see "Previous 1  2 Next"
