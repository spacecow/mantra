Feature:
Background:
Given a manga exists with title: "Ashita no Joe"
When I go to that manga's new page page

@create
Scenario: Create a new page
When I fill in "Page no." with "1"
And I press "Create"
Then I should be redirected to that manga's page
And I should see flash notice message /Successfully created page./
And a page should exist with no: "1"
And 1 pages should exist

@cancel
Scenario: Cancel the creation of a page
When I press "Cancel"
Then I should be redirected to that manga's page
And I should see /Ashita no Joe/ as title
And I should see no flash message
And 0 pages should exist

@pending
Scenario: Page cannot be set by the user
