Feature:
Background:
Given an article exists with title: "Yeah!", body: "Oh, yeah!"
When I go to that article page

Scenario: Show article view
Then I should see /Yeah!/ as title
And I should see /Oh, yeah!/ as article
And I should see links /Edit\s*Del\s*List articles/ at the top of the page
And I should see links /Edit\s*Del\s*List articles/ at the bottom of the page

Scenario Outline: Links from the article view
When I follow "<link>" at the <location> of the page
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
