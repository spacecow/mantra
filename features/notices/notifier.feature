Feature:
Background:
Given a user exists
And I am logged in as that user
And a manga exists
And a page: "1" exists with manga: that manga, no: 1
And a page: "2" exists with manga: that manga, no: 2
And a translation "1" exists with page: page "1", pos: 1
And a translation "2" exists with page: page "2", pos: 1
And a notice is created with page: page "2", translation: translation "2", message: "See you Friday!"
And a notice is created with page: page "1", translation: translation "1", message: "明日♦tomorrow"

Scenario: Notices should be listed in order: latest created on top
When I go to that manga's page
Then I should see "See you Friday!" as the first notice
And I should see "明日 tomorrow" as the second notice

Scenario Outline: Links within the Notifier
When I go to that manga's page
And I follow "<link>"
Then I should be redirected to that manga's page "<no>"'s page
Examples:
| link            | no |
| See you Friday! |  2 |
| 明日 tomorrow   |  1 |
