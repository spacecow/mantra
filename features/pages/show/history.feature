Feature:
Background:
Given a manga exists
And a page "1" exists with manga: that manga, no: 1
And a page "2" exists with manga: that manga, no: 2
And a translation "1" exists with page: page "1", pos: 1
And a translation "2" exists with page: page "2", pos: 1
And a history "1" exists with translation: translation "1", message: "Right!"
And a history "2" exists with translation: translation "2", message: "Oh yeah!"
And a user exists
And I am logged in as that user

Scenario: Notices are not shown on the manga page page
Given a notice exists with page: page "1", message: "That's right"
When I go to that manga's page "1"'s page
Then I should see no "notifier" section

Scenario Outline: The Notifier only show notices from the same manga page page
When I go to that manga's page "<no>"'s page
Then I should see "<see>" within the histories section
And I should not see "<not_see>" within the histories section
Examples:
| no | see      | not_see  |
|  1 | Right    | Oh yeah! |
|  2 | Oh yeah! | Right!   |
