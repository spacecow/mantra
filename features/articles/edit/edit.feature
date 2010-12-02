Feature:
Background:
Given an article exists with title: "Yeah!", body: "Oh, yeah!"
When I go to that article's edit page

Scenario: Edit an article
When I fill in "Title" with "Wow!"
And I fill in "Body" with "Woswers!"
And I press "Update"
Then I should be redirected to the articles page
And I should see flash notice message /Successfully updated article./
And an article should exist with title: "Wow!", body: "Wowsers!"
And 1 articles should exist
