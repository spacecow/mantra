Feature:
Background:
Given an article exists with title: "Yeah!", body: "Oh, yeah!"
When I go to that article page

Scenario: Show article view
Then I should see /Yeah!/ as title
