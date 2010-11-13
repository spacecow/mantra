Feature:

@create
Scenario: Create a new page
Given a manga exists
When I go to that manga's new page page
And I fill in "Page no." with "1"
And I press "Create Page"
Then I should be redirected to that manga's page
And I should see flash notice message /Successfully created page./
And a page should exist with no: "1"
And 1 pages should exist

