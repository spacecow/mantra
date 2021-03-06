Feature:
Background:
Given a user exists with email: "jsveholm@gmail.com"
And I am logged in as "jsveholm@gmail.com"
When I go to the new article page

Scenario: Cancel a new article creation
When I press "Cancel"
Then I should be redirected to the articles page
And I should see no flash message
And I should see /Articles/ as title
And 0 articles should exist

Scenario: Create a new article
When I fill in "Title" with "Yeah!"
And I fill in "Body" with "Oh, yeah!"
And I press "Create"
Then I should see flash notice message /Successfully created article./
And an article should exist with title: "Yeah!", body: "Oh, yeah!"
And I should be redirected to that article's page
And 1 articles should exist
