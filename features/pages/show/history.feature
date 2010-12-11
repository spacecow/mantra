Feature:
Background:
Given a manga exists
And a page "1" exists with manga: that manga, no: 1
And a page "2" exists with manga: that manga, no: 2
And a translation "1" exists with page: page "1", pos: 1
And a translation "2" exists with page: page "2", pos: 1
And a user exists
And I am logged in as that user

Scenario: Notices are not shown on the manga page page
Given a notice is created with page: page "1", translation: translation "1", message: "That's right"
When I go to that manga's page "1"'s page
Then I should see no "notifier" section

Scenario Outline: The Notifier only show notices from the same manga page page
Given a history "1" exists with translation: translation "1", message: "明日♦tomorrow", category_mask: 1
And a history "2" exists with translation: translation "2", message: "今日♦today", category_mask: 2
When I go to that manga's page "<no>"'s page
Then I should see "<see>" within the histories section
And I should not see "<not_see>" within the histories section
Examples:
| no | see                | not_see  |
|  1 | New: 明日 tomorrow | Oh yeah! |
|  2 | Edit: 今日 today   | Right!   |

Scenario: With no history, the sidebar should not be shown
When I go to that manga's page's page
Then I should see no "user_nav" section

Scenario: If you delete a translation, its history and notices should die
Given a history exists with translation: translation "1", message: "明日♦tomorrow", category_mask: 1
And a notice is created with page: page "1", translation: translation "1", message: "明日♦tomorrow"
When I go to that manga's page "1"'s page
And I follow "Del"
Then 0 notices should exist
