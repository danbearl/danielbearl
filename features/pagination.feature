Feature: Pagination
  Scenario: Posts will paginate in batches of 10
    Given the following posts:
      | title    | body |
      | First    | text |
      | Second   | text |
      | Third    | text |
      | Fourth   | text |
      | Fifth    | text |
      | Sixth    | text |
      | Seventh  | text |
      | Eighth   | text |
      | Ninth    | text |
      | Tenth    | text |
      | Eleventh | text |
    And I am on the blog page
    Then I should not see "First"
    And I should see "Previous 1  2 Next"
