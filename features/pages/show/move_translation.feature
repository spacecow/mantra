Feature:
Background:
Given a manga exists
And a page exists with manga: that manga
And a translation: "1" exists with page: that page, pos: 1, english: "a"
And a translation: "2" exists with page: that page, pos: 2, english: "b"
And a translation: "3" exists with page: that page, pos: 3, english: "c"
When I go to that manga's page's page

Scenario: Move a translation down
And I follow "down_arrow" within translation "1"
Then a translation should exist with pos: 2, english: "a"
And a translation should exist with pos: 1, english: "b"
And a translation should exist with pos: 3, english: "c"

Scenario: Move a translation up
And I follow "up_arrow" within translation "2"
Then a translation should exist with pos: 2, english: "a"
And a translation should exist with pos: 1, english: "b"
And a translation should exist with pos: 3, english: "c"

@pending
Scenario: Change activation when moving
