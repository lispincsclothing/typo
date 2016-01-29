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
    Then I should see "SXSW"
    Then I should see "Conference"
    Then I should see "Description Text"
    Then I should see "Permalink Address"

  # Sad path
  # Scenario: Abandon creation of a category
  #   Given I am on the admin home page
  #   When I follow "Categories"
  #   Then I should be on the new_and_edit category page
    
  #   When I fill in "Name" with "SXSW"
  #   And I fill in "Keywords" with "Conference"
  #   And I fill in "Description" with "Lorum Ipsum"
  #   And I press "Save"
  #   Then I should be on the new_and_edit category page
  #   Then I should see "SXSW"