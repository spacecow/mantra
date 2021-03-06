Feature:
Background:
Given a manga exists
And a page exists with manga: that manga
And a translation: "1" exists with page: that page, pos: 1
And a translation: "2" exists with pos: 2, japanese: "明日", english: "tomorrow", page: that page
And a user exists with email: "test@example.com"
And I am logged in as "test@example.com"

Scenario: Edit a translation
When I go to that manga's page's translation's edit page
And I fill in "Japanese" with "今日"
And I fill in "English" with "today"
And I press "Update"
Then I should be redirected to that manga's page's page
And I should see no flash message
And the page should have a translation with japanese: "今日", english: "today"
And the page should have 2 translations
And the page should have a translation should have a history with message: "今日♦today", category_mask: 2
And I should see translation "2" as active
And that page should have a notice with message: "今日♦today"
And that page should have 1 notices

Scenario: Cancel a translation edit
When I go to that manga's page's translation "2"'s edit page
And I press "Cancel"
Then I should be redirected to that manga's page's page
And I should see no flash message
And the page should have a translation with japanese: "明日", english: "tomorrow"
And the page should have 2 translations
And I should see translation "2" as active
