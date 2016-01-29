Feature: Create Categories
  As a blog administrator
  In order to categorize my work
  I want to be able to add categories to my blog

  Background:
    Given the blog is set up
    And I am logged into the admin panel

  # Happy path
  Scenario: Successfully create a new category
    #Use the path defined below (admin home page), rather than looking for text "Welcome back, admin!"
    # Then I should see "Welcome back, admin!"
    Given I am on the admin home page
    When I follow "Categories"
    #Use the path defined below (new_and_edit page), rather than looking for text "Your category slug."
    # Then I should see "Your category slug."
    Then I should be on the new_and_edit category page
    
    #Name is equivalent to "category_name" (one using a href text, other using id) - decided to use what's on page
    # When I fill in "category_name" with "SXSW"
    When I fill in "Name" with "SXSW"
    And I fill in "Keywords" with "Conference"
    And I fill in "Description" with "Description Text"
    # switching keyword and a href for illustrative purposes
    When I fill in "category_permalink" with "Permalink Address"
    # And I fill in "Permalink" with "Permalink Address"
    And I press "Save"
    Then I should be on the new_and_edit category page
    # check flash message
    And I should see "Category was successfully saved."
    And I should see "Categories"
    And I should see "Your category slug"
    And I should see "SXSW"
    And I should see "Conference"
    And I should see "Description Text"
    And I should see "Permalink Address"

  # Sad path (copy happy above and negate, key changes commented)
  Scenario: Abandon creation of a category
    Given I am on the admin home page
    When I follow "Categories"
    Then I should be on the new_and_edit category page
    
    When I fill in "Name" with "SXSW"
    And I fill in "Keywords" with "Conference"
    And I fill in "Description" with "Description Text"
    When I fill in "category_permalink" with "Permalink Address"
    # Change to follow "Cancel" link rather than submit "Save" form
    And I follow "Cancel"
    Then I should be on the new_and_edit category page
    # no flash message
    And I should not see "Category was successfully saved."
    # same messages 
    And I should see "Categories"
    And I should see "Your category slug"
    # no new category created
    And I should not see "SXSW"
    And I should not see "Conference"
    And I should not see "Description Text"
    And I should not see "Permalink Address"