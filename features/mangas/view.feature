Feature: Global view for manga

Scenario Outline: No top links should be visible
Given a manga exists
When I go to the <path> page
Then I should see no links at the top of the page
Examples:
| path         |
| manga's edit |
| manga's      |
| new manga    |

