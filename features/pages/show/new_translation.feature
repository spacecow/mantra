Feature: Create a new translation
Background:
Given a manga exists
And a page: "1" exists with manga: that manga, no: 1
And a page: "2" exists with manga: that manga, no: 2
And a page: "3" exists with manga: that manga, no: 3

Scenario: New translation form
When I go to that manga's page's page
And the 'japanese' field should be empty
And the 'english' field should be empty
And I should see a 'create translation' button

Scenario Outline: The translation form should be active as default if no translations exists
Given a translation exists with page: page "1", pos: 1
And a translation exists with page: page "1", pos: 2
And a translation exists with page: page "3", pos: 1
When I go to that manga's page: "<no>"'s page
And I should see "<translation_status>" classes within the translation form section
And I should see "<empty_status>" classes within the bottom empty translation section
Examples:
| no | translation_status      | empty_status  |
|  1 | non-active              |               |
|  2 |                         | round-topleft |
|  3 | non-active below-active |               |

Scenario: Create a new translation
Given a translation: "1" exists with page: that page, pos: 1, english: "Jack"
When I go to that manga's page's page
When I fill in "Japanese" with "明日"
And I fill in "English" with "tomorrow"
And I press "Create Translation"
Then a translation: "2" should exist with pos: 2, japanese: "明日", english: "tomorrow"
And 2 translations should exist
And I should see translation "2" as active
