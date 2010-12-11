Feature:
Background:
Given an article exists with title: "Yeah!", created_at: "2010-12-6", body: "I noticed that in jQuery, mouseenter behaves like mouseover in combination with live(). Someone else than"
And a manga exists with title: "Ashita no Joe"
And a page exists with manga: that manga, no: 6
And a translation: "1" exists with page: that page, japanese: "今日", english: "today", pos: 1
And a translation: "2" exists with page: that page, japanese: "明日", english: "tomorrow", pos: 2

Scenario: Blog view
When I go to the mangas page
Then I should see /Blog/ within the blog section "title"
And I should see /Yeah!/ within the blog section "subtitle"
And I should see /December 6th, 2010/ within the blog section "date"
And I should see /I noticed that in jQuery, mouseenter behaves like mouseover in combination with live\(\)\. Someone e\.\.\./ within the blog section "content"

Scenario: Blog links
When I go to the mangas page
When I follow "Yeah!" within the blog section
Then I should be redirected to that article's page
