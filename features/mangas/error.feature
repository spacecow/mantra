@error @manga
Feature:
Background:
Given a manga exists with title: "Ashita no Joe"

Scenario Outline: The manga title cannot be left blank
When I go to <page> page
And I fill in "Title" with ""
And I press "<action> Manga"
Then I should see title error /can't be blank/
Examples:
| page              | action |
| the new manga     | Create |
| that manga's edit | Update |

Scenario Outline: The manga title must be unique
Given a manga exists with title: "Violence Jack"
When I go to <page> page
And I fill in "Title" with "Ashita no Joe"
And I press "<action> Manga"
Then I should see title error /is already taken/
Examples:
| page              | action |
| the new manga     | Create |
| that manga's edit | Update |
