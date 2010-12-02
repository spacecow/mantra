Feature:
Background:
When I go to the new article page

Scenario: New article view
Then I should see /New Article/ as title
And the 'title' field should be empty
And the 'body' field should be empty
And I should see a 'create' button
And I should see a 'cancel' button
