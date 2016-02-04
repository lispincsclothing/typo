Feature: Merge articles
    As a blog administrator
    In order to merge two articles (and not the same article)
    I want to see a merge form on the edit article page & marge articles
    
Background:
    Given the blog is set up
    And the following users exist:
    And the following articles exist:
    And the following comments exist:
    
Scenario: Admin can successfully merge articles
    Given I am logged in as XXX
    And I am on the edit page of Article with id XXX
    Then I should see "Merge Articles"
    When I fill in "Merge with" with XXX+1
    And I press "Merge"
    Then I should be on the admin content page
    And I should see "Articles successfully merged!"
