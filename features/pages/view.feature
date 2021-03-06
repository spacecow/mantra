Feature: Global view for pages
Background:
Given a manga exists with title: "Ashita no Joe"
And a page exists with manga: that manga
And a user exists with email: "test@example.com"
And I am logged in as "test@example.com"

Scenario Outline: A link to the manga title should be visible
When I go to that manga's <path> page
Then I should see "Ashita no Joe" within the site nav section
Examples:
| path        |
| page's edit |
| page's      |
| new page    |

Scenario Outline: Follow the manga link
When I go to that manga's <path> page
And I follow "Ashita no Joe" within the site nav section
Then I should be redirected to that manga page
Examples:
| path        |
| page's edit |
| page's      |
| new page    |
