Feature:
Background:
Given an article exists with title: "Yeah!", body: "Oh, yeah!"
When I go to that article's edit page

Scenario: Article edit view
Then I should see /Edit Article/ as title
And the 'title' field should contain "Yeah!"
And the 'body' field should contain "Oh, yeah!"
And I should see an 'update' button
And I should see a 'cancel' button
