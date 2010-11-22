Feature: Translation errors
Background:
Given a manga exists
And a page exists with manga: that manga

Scenario: English has to be filled in
Given I go to the manga's page's page
And I press "Create Translation"
Then I should see english error /can't be blank/
And I should see the translation form as active
