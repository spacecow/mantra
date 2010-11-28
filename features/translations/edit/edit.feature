Feature:
Background:
Given a manga exists
And a page exists with manga: that manga
And that page has a translation: "1" with pos: 1
And that page has a translation: "2" with pos: 2, japanese: "明日", english: "tomorrow"

Scenario: Edit a translation
When I go to that manga's page's translation's edit page
And I fill in "Japanese" with "今日"
And I fill in "English" with "today"
And I press "Update"
Then I should be redirected to that manga's page's page
And I should see flash notice message /Successfully updated translation./
And the page should have a translation with japanese: "今日", english: "today"
And the page should have 2 translations
And I should see translation "2" as active

Scenario: Cancel a translation edit
When I go to that manga's page's translation "2"'s edit page
And I press "Cancel"
Then I should be redirected to that manga's page's page
And I should see no flash message
And the page should have a translation with japanese: "明日", english: "tomorrow"
And the page should have 2 translations
And I should see translation "2" as active
