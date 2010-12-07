Feature:
Background:
Given an article exists with title: "Yeah!", created_at: "2010-12-6", body: "I noticed that in jQuery, mouseenter behaves like mouseover in combination with live(). Someone else than"
And a manga exists with title: "Ashita no Joe"
And a page exists with manga: that manga, no: 6
And a translation: "1" exists with page: that page, japanese: "今日", english: "today", pos: 1
And a translation: "2" exists with page: that page, japanese: "明日", english: "tomorrow", pos: 2
And a notice is created with page: that page, translation: that translation

Scenario: Blog view
When I go to the mangas page
Then I should see /Blog/ within the blog section "title"
And I should see /Yeah!/ within the blog section "subtitle"
And I should see /December 6th, 2010/ within the blog section "date"
And I should see /I noticed that in jQuery, mouseenter behaves like mouseover in combination with live\(\)\. Someone e\.\.\./ within the blog section "content"

Scenario: Latest translation view
When I go to the mangas page
Then I should see /Latest Translation/ within the latest_translation section "title"
And I should see /Ashita no Joe, page 6/ within the latest_translation section "subtitle" 
And I should see /less than a minute ago/ within the latest_translation section "ago"
And I should see /明日/ within the latest_translation section "japanese"
And I should see /tomorrow/ within the latest_translation section "english"

Scenario: Blog links
When I go to the mangas page
When I follow "Yeah!" within the blog section
Then I should be redirected to that article's page

Scenario: Translation links
Given a user exists with email: "test@example.com"
And I am logged in as "test@example.com"
When I go to the mangas page
And I follow "Ashita no Joe, page 6" within the latest_translation section
Then I should be redirected to that manga's page's page
And I should see translation "2" as active
