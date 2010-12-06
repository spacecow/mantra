Feature:
Background:
Given an article exists with title: "Yeah!", created_at: "2010-12-6", body: "I noticed that in jQuery, mouseenter behaves like mouseover in combination with live(). Someone else than"
When I go to the mangas page

Scenario: Blog view
Then I should see /BLOG/ within the sidebar section "title"
And I should see /Yeah!/ within the sidebar section "subtitle"
And I should see /December 6th, 2010/ within the sidebar section "date"
And I should see /I noticed that in jQuery, mouseenter behaves like mouseover in combination with live\(\)\. Someone e\.\.\./ within the sidebar section "content"

Scenario: Blog links
When I follow "Yeah!" within the sidebar section
