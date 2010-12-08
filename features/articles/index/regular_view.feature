Feature:

Scenario: View articles index for regular user
When I go to the articles page
Then I should see /Articles/ as title
And I should see no links at the bottom of the page

Scenario: List articles on the index page for regular user
Given an article exists with title: "Yeah!", body: "Oh, yeah!"
When I go to the articles page
Then I should not see "Edit" within the articles section

Scenario: List articles on the index page for regular user in order
Given an article exists with title: "Yeah!", body: "Oh, yeah!", created_at: "2010-12-6"
Given an article exists with title: "Wow!", body: "Wowsers!", created_at: "2010-12-9"
When I go to the articles page
Then I should see "articles" table
| Wow! - December 9th, 2010  |
| Yeah! - December 6th, 2010 |
