Feature:

Scenario: View articles index for admin
Given a user exists with email: "jsveholm@gmail.com"
And I am logged in as "jsveholm@gmail.com"
When I go to the articles page
Then I should see /Articles/ as title
And I should see links "New Article" at the bottom of the page

Scenario: List articles on the index page for admin
Given an article exists with title: "Yeah!", body: "Oh, yeah!"
And a user exists with email: "jsveholm@gmail.com"
And I am logged in as "jsveholm@gmail.com"
When I go to the articles page
Then I should see "articles" table
| Yeah! | Edit Del |

Scenario Outline: Links on the articles index page for admin
Given an article exists with title: "Yeah!", body: "Oh, yeah!"
And a user exists with email: "jsveholm@gmail.com"
And I am logged in as "jsveholm@gmail.com"
When I go to the articles page
And I follow "<link>"
Then I should be redirected to the <path> page
And <no> articles should exist
Examples:
| link        | path           | no |
| New Article | new article    |  1 |
| Yeah!       | article        |  1 |
| Edit        | article's edit |  1 |
| Del         | articles       |  0 |
