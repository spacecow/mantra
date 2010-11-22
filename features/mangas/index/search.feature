Feature: Search

Scenario: Search form
When I go to the mangas page
Then the "search" field should be empty
And I should see a 'search' button

Scenario: Search should redirect to index
When I go to the mangas page
And I press "Search"
Then I should be redirected to the mangas page

Scenario Outline: Search for a manga
Given a manga exists with title: "Ashita no Joe"
And I fill in "search" with "<search>"
And I press "Search"
Then I <view> see "Ashita no Joe" within the mangas table
Examples:
| search | view       |
| Ashita | should     |
| ashita | should     |
| asita  | should not |
