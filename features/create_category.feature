Feature: Create Categories
  As a blog administrator
  In order to categorize my work
  I want to be able to add categories to my blog

  Background:
    Given the blog is set up
    And I am logged into the admin panel

  Scenario: Successfully add categories
    Given I am on the new_and_edit category page
    When I fill in "Name" with "SXSW"
    And I fill in "Keywords" with "Conference"
    And I fill in "Description" with "Lorum Ipsum"
    And I press "Save"
    Then I should be on the new_and_edit category page
    Then I should see "SXSW"
