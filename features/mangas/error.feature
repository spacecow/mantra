@error @manga
Feature:
Background:
Given a manga exists with title: "Ashita no Joe"
And a user exists with email: "test@example.com"
And I am logged in as "test@example.com"

Scenario Outline: The manga title cannot be left blank
When I go to <page> page
And I fill in "Title" with ""
And I press "<action>"
Then I should see title error /can't be blank/
Examples:
| page              | action |
| the new manga     | Create |
| that manga's edit | Update |

Scenario Outline: The manga title must be unique
Given a manga exists with title: "Violence Jack"
When I go to <page> page
And I fill in "Title" with "Ashita no Joe"
And I press "<action>"
Then I should see title error /is already taken/
Examples:
| page              | action |
| the new manga     | Create |
| that manga's edit | Update |
