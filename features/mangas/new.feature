@new @view @manga
Feature:
Background:
Given a user exists with email: "test@example.com"
And I am logged in as "test@example.com"
When I go to the new manga page

@default
Scenario: New manga view
Then I should see /New Manga/ as title
And the 'title' field should be empty
And I should see a 'create' button
And I should see a 'cancel' button

@create
Scenario: Create a new manga
When I fill in "Title" with "Ashita no Joe"
And I press "Create"
Then I should be redirected to the mangas page
And I should see flash notice message /Successfully created manga./
And a manga should exist with title: "Ashita no Joe"
And 1 mangas should exist

@cancel
Scenario: Cancel the creation of a manga
And I press "Cancel"
Then I should be redirected to the mangas page
And I should see /Ongoing Projects/ as title
And I should see no flash message
And 0 mangas should exist

@pendig
Scenario: Title cannot be written in Japanese
