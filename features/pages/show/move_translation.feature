Feature:
Background:
Given a manga exists
And a page exists with manga: that manga
And a translation: "1" exists with page: that page, pos: 1, english: "a"
And a translation: "2" exists with page: that page, pos: 2, english: "b"
And a translation: "3" exists with page: that page, pos: 3, english: "c"
And a user exists with email: "test@example.com"
And I am logged in as "test@example.com"

Scenario: Move a translation down
When I go to that manga's page's page
And I follow "down_arrow" within translation "1"
Then the page should have a translation with pos: 1, english: "b"
And the page should have a translation with pos: 2, english: "a"
And the page should have a translation with pos: 3, english: "c"
And the page should have 3 translations
And I should see translation "2" as active
And I should see the top empty translation fillout as inactive

Scenario: Move a translation up
When I go to that manga's page's page
And I follow "up_arrow" within translation "2"
Then the page should have a translation with pos: 1, english: "b"
And the page should have a translation with pos: 2, english: "a"
And the page should have a translation with pos: 3, english: "c"
And I should see translation "1" as active
