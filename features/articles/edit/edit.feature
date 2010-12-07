Feature:
Background:
Given an article exists with title: "Yeah!", body: "Oh, yeah!"
And a user exists with email: "jsveholm@gmail.com"
And I am logged in as "jsveholm@gmail.com"
When I go to that article's edit page

Scenario: Edit an article
When I fill in "Title" with "Wow!"
And I fill in "Body" with "Wowsers!"
And I press "Update"
Then I should be redirected to that article's page
And I should see flash notice message /Successfully updated article./
And an article should exist with title: "Wow!", body: "Wowsers!"
And 1 articles should exist
