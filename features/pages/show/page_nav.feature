Feature:
Background:
Given a manga exists
And a page: "1" exists with manga: that manga, no: 1
And a page: "3" exists with manga: that manga, no: 3
And a page: "4" exists with manga: that manga, no: 4


Scenario: View of the page nav
When I go to that manga's page's page
Then I should see /Previous\s*Next/ within the page nav section

Scenario Outline: Follow links in the page nav
When I go to that manga's page "3"'s page
And I <extra>
And I follow "<link>" within the page nav section
Then I should be redirected to that manga's page "<no>"'s page
Examples:
| link     | no | extra          |
| Previous |  1 | do nothing     |
| Next     |  4 | do nothing     |
| Previous |  1 | press "Create" |

Scenario Outline: The links in the page nav should not be activated if they do not lead somewhere
When I go to that manga's page "<no>"'s page
Then I should see no link "<link1>" within the page nav section
And I should see a link "<link2>" within the page nav section
Examples:
| no | link1    | link2    |
|  1 | Previous | Next     |
|  4 | Next     | Previous |
