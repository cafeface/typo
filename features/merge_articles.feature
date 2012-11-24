Feature: Merge Articles
  As a blog administrator
  In order to organize the blog effectively
  I want to be able to merge articles
  
  Background:
    Given the blog is set up
    Given the following articles exist:
    | title  | author   | body        | extended | published_at        |
    | Blech  | cafeface | blech body  |          | 20/11/2012 at 20h58 |
    | Foobar | cafeface | foobar body |          | 20/11/2012 at 20h58 |
    
  Scenario: A non-admin cannot merge articles
    Given I am not logged into the admin panel
    And I am on the edit page for "Blech"
    Then I should not see "Merge Articles"

  Scenario: When articles are merged, the merged article should contain the text of both previous articles
    Given I am logged into the admin panel
    And I am on the edit page for "Blech"
    Then I should see "Merge Articles"
    When I fill in "merge_with" with the id for "Foobar"
    And I press "Merge"
    Then I should be on the admin content page
    When I go to the home page
    Then I should see "Blech"
    And I should not see "Foobar"
    When I follow "Blech"
    Then I should see "blech body"
    And I should see "foobar body"
