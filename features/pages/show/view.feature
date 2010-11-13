Feature:
Background:
Given a manga exists
And a page exists with no: "1", manga: that manga

Scenario: Show page view
When I go to that manga's page's page
Then I should see no "translations" section
