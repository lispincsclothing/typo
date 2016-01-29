Feature: Create Categories
  As a blog administrator
  In order to categorize my work
  I want to be able to edit categories already created on my blog

  Background:
    Given the blog is set up
    And I am logged into the admin panel
    
  #copied from create_category.feature and modified (deleted comments about how to follow keys vs keywords, look to that source for more details) 
  #happy path!
  Scenario: Successfully edit the initial "General" category
    Given I am on the admin home page
    When I follow "Categories"
    Then I should be on the new_and_edit category page
    
    And I should see "General"
    # TODO- what is sample_name
    And I should not see "sample_name"
    # Follow edit link
    When I follow "Edit"
    When I fill in "Name" with "SXSW"
    And I fill in "Keywords" with "Conference"
    And I fill in "Description" with "Description Text"
    When I fill in "category_permalink" with "Permalink Address"
    And I press "Save"
    Then I should be on the new_and_edit category page
    And I should see "Category was successfully saved."
    And I should see "Categories"
    And I should see "Your category slug"
    And I should see "SXSW"
    And I should see "Conference"
    And I should see "Description Text"
    And I should see "Permalink Address"
    
  #sad path
   Scenario: Star to edit the changed category, but abandon it
    Given I am on the admin home page
    When I follow "Categories"
    Then I should be on the new_and_edit category page
    
    And I should see "General"
    And I should not see "sample_name"
    When I follow "Edit"
    When I fill in "Name" with "SXSW"
    And I fill in "Keywords" with "Conference"
    And I fill in "Description" with "Description Text"
    When I fill in "category_permalink" with "Permalink Address"
    # follow cancel link, rather than submit "Save" form
    And I follow "Cancel"
    Then I should be on the new_and_edit category page
    And I should not see "Category was successfully saved."
    And I should see "Categories"
    And I should see "Your category slug"
    And I should not see "SXSW"
    And I should not see "Conference"
    And I should not see "Description Text"
    And I should not see "Permalink Address"