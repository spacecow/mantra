@edit @view
Feature:
Background:
Given a manga exists with title: "Ashita no Joe"
And a user exists with email: "test@example.com"
And I am logged in as "test@example.com"
When I go to that manga's edit page

@default
Scenario: Edit manga view
Then I should see /Edit Manga/ as title
And the "Title" field should contain "Ashita no Joe"
And I should see links "Show Delete List mangas" at the bottom of the page

@links
Scenario Outline: Links on the bottom of the edit manga page
When I follow "<link>" at the bottom of the page
Then I should be redirected to <page> page
And <no> mangas should exist
Examples:
| link        | page         | no |
| Show        | that manga's |  1 |
| Delete      | the mangas   |  0 |
| List mangas | the mangas   |  1 |
