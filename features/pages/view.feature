Feature: Global view for pages
Background:
Given a manga exists with title: "Ashita no Joe"
And a page exists with manga: that manga

Scenario Outline: A link to the manga title should be visible
When I go to that manga's <path> page
Then I should see links "Ashita no Joe" at the top of the page
Examples:
| path        |
| page's edit |
| page's      |
| new page    |

Scenario Outline: Follow the manga link
When I go to that manga's <path> page
And I follow "Ashita no Joe" at the top of the page
Then I should be redirected to that manga page
Examples:
| path        |
| page's edit |
| page's      |
| new page    |
