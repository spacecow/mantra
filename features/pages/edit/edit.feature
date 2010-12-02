Feature: Edit a page
Background:
And a user exists with email: "test@example.com"
And I am logged in as "test@example.com"

@edit
Scenario: Edit a new page
Given a manga exists
And a page exists with no: "1", manga: that manga
When I go to that manga's page's edit page
And I fill in "Page no." with "2"
And I press "Update"
Then I should be redirected to that manga's page
And I should see flash notice message /Successfully updated page./
And a page should exist with no: "2"
And 1 pages should exist
