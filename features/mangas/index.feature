@mangas
Feature:
Background:
Given a manga exists with title: "Ashita no Joe"
When I go to the mangas page

@list
Scenario: List mangas
Then I should see "mangas" table
| Ashita no Joe | Edit Del |

@links
Scenario Outline: Links within a manga
When I follow "<link>" within that manga
Then I should be redirected to the <page> page
And <no> mangas should exist
Examples:
| link          | page         | no |
| Ashita no Joe | manga's      | 1  |
| Edit          | manga's edit | 1  |
| Del           | mangas       | 0  |
