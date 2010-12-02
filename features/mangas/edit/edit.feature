Feature:
Background:
Given a user exists with email: "test@example.com"
And I am logged in as "test@example.com"

@edit
Scenario: Edit a manga
Given a manga exists with title: "Ashita no Joe"
When I go to that manga's edit page
And I fill in "Title" with "Violence Jack"
And I press "Update"
Then I should be redirected to that manga's page
And I should see flash notice message /Successfully updated manga./
And a manga should exist with title: "Violence Jack"
And 1 mangas should exist
