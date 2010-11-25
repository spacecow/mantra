@new @view @manga
Feature:
Background:
When I go to the new manga page

@default
Scenario: New manga view
Then I should see /New Manga/ as title
And the "Title" field should be empty

@create
Scenario: Create a new manga
When I fill in "Title" with "Ashita no Joe"
And I press "Create"
Then I should be redirected to the mangas page
And I should see flash notice message /Successfully created manga./
And a manga should exist with title: "Ashita no Joe"
And 1 mangas should exist
