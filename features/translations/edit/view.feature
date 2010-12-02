Feature:
Background:
Given a manga exists
And a page exists with manga: that manga
And a translation: "1" exists with page: that page, pos: 1, japanese: "明日", english: "tomorrow"
And a translation: "2" exists with page: that page, pos: 2
And a user exists with email: "test@example.com"
And I am logged in as "test@example.com"

Scenario: Edit translation view
When I go to that manga's page's translation "1"'s edit page
Then the 'japanese' field should contain "明日"
And the 'english' field should contain "tomorrow"
And I should see a 'update' button
And I should see a 'cancel' button

Scenario: Translations staus if first translation is to be edited
When I go to that manga's page's translation "1"'s edit page
Then I should see the top empty translation fillout as above-active
And I should see the translation form as active
And I should see translation "2" as below-active
And I should see the bottom empty translation fillout as inactive

Scenario: Translations staus if last translation is to be edited
When I go to that manga's page's translation "2"'s edit page
Then I should see the top empty translation fillout as inactive
And I should see translation "1" as above-active
And I should see the translation form as active
And I should see the bottom empty translation fillout as below-active

Scenario: Inactive translations should have no arrows on the edit translation page
When I go to that manga's page's translation "1"'s edit page
Then I should see no arrows within translation "2"

Scenario: Inactive translations should have no links on the edit translation page
When I go to that manga's page's translation "1"'s edit page
Then I should see no "links" section within translation "2"
