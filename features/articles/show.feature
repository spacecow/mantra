Feature:
Background:
Given an article exists with title: "Yeah!", body: "Oh, yeah!"
And a user exists with email: "jsveholm@gmail.com"

Scenario: Show article view for admin
Given I am logged in as "jsveholm@gmail.com"
When I go to that article page
Then I should see /Yeah!/ as title
And I should see /Oh, yeah!/ as article
And I should see links /Edit\s*Del\s*List articles/ at the top of the page
And I should see links /Edit\s*Del\s*List articles/ at the bottom of the page

Scenario: Show article view for regular users
When I go to that article page
Then I should see /Yeah!/ as title
And I should see /Oh, yeah!/ as article
And I should see no links at the top of the page
And I should see no links at the bottom of the page

Scenario Outline: Links from the article view
Given I am logged in as "jsveholm@gmail.com"
When I go to that article page
And I follow "<link>" at the <location> of the page
Then I should be redirected to the <page> page
And <no> articles should exist
Examples:
| link          | page           | no | location |
| Edit          | article's edit |  1 | bottom   |
| Del           | articles       |  0 | bottom   |
| List articles | articles       |  1 | bottom   |
| Edit          | article's edit |  1 | top      |
| Del           | articles       |  0 | top      |
| List articles | articles       |  1 | top      |
