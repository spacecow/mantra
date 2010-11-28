Feature: Create a new translation
Background:
Given a manga exists
And a page: "1" exists with manga: that manga, no: 1
And a page: "2" exists with manga: that manga, no: 2
And a page: "3" exists with manga: that manga, no: 3

Scenario: Create a new translation
#Given a translation: "1" exists with page: that page, pos: 1, english: "Jack"
When I go to that manga's page's page
When I fill in "Japanese" with "明日"
And I fill in "English" with "tomorrow"
And I press "Create"
Then the page should have 1 translations
#Then a translation: "2" should exist with pos: 2, japanese: "明日", english: "tomorrow"
#And 2 translations should exist
#And I should see translation "2" as active

Scenario: New translation form
When I go to that manga's page's page
And the 'japanese' field should be empty
And the 'english' field should be empty
And I should see a 'create' button
And I should see no 'cancel' button

Scenario Outline: The translation form should be active as default if no translations exists
Given a translation exists with page: page "1", pos: 1
And a translation exists with page: page "1", pos: 2
And a translation exists with page: page "3", pos: 1
When I go to that manga's page: "<no>"'s page
Then I should see the translation form as <translation_status>
And I should see the top empty translation fillout as above-active
And I should see the bottom empty translation fillout as <bottom_empty_status>
Examples:
| no | translation_status | bottom_empty_status |
|  1 | inactive         | inactive          |
|  2 | active             | below-active        |
|  3 | below-active       | inactive          |
