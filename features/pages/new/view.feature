@new @view @page
Feature:
Background:
Given a manga exists with title: "Ashita no Joe"
When I go to the manga's new page page
  
@default
Scenario: New page view
Then I should see /New Page/ as title
And the "Page no." field should be empty
And I should see no links at the bottom of the page
