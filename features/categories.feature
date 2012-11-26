Feature: Create Categories
  As a blog administrator
  In order to organize the blog effectively
  I want to be able to have article categories and to categorize articles
  
  Background:
    Given the blog is set up
    And I am logged into the admin panel
    
  Scenario: An admin can create categories
    When I follow "Categories"
    Then I should be on the categories page
    When I fill in "Name" with "Foobar"
    And I fill in "Description" with "cucumber category"
    And I press "Save"
    Then I should be on the categories page
    And I should see "Category was successfully saved."
    And I should see "Foobar"
    And I should see "cucumber category"
    When I follow "Foobar"
    When I fill in "Keywords" with "blech"
    And I press "Save"
    Then I should be on the categories page
    And I should see "Category was successfully saved."
    And I should see "blech"
