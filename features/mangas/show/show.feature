@view @mangas
Feature:
Background:
Given a manga exists with title: "Ashita no Joe"
And a user exists with email: "test@example.com"
And I am logged in as "test@example.com"
When I go to that manga's page

@default
Scenario: Show manga view
Then I should see /Ashita no Joe/ as title
And I should see links "Edit Delete List mangas" at the bottom of the page

@links
Scenario Outline: Links on the bottom of the show manga page
When I follow "<link>" at the bottom of the page
Then I should be redirected to <page> page
And <no> mangas should exist
Examples:
| link        | page              | no |
| Edit        | that manga's edit |  1 |
| Delete      | the mangas        |  0 |
| List mangas | the mangas        |  1 |
