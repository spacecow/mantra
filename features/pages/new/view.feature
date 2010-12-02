@new @view @page
Feature:
Background:
Given a manga exists with title: "Ashita no Joe"
When I go to the manga's new page page
  
@default
Scenario: New page view
Then I should see /New Page/ as title
And the 'page_no' field should be empty
And I should see a 'create' button
And I should see a 'cancel' button
