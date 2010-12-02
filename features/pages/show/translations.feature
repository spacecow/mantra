Feature:
Background:
Given a manga exists
And a page: "1" exists with manga: that manga, no: 1
And a page: "2" exists with manga: that manga, no: 2
And a user exists with email: "test@example.com"
And I am logged in as "test@example.com"

Scenario Outline: View of translation section
Given a translation exists with page: page "<page>", pos: 1
When I go to that manga's page "1"'s page
Then I should see a "translations" section
Examples:
| page |
|    1 |
|    2 |

@view
Scenario Outline: View of a translation
Given a translation exists with page: page "1", pos: 1, japanese: "明日", english: "tomorrow"
When I go to that manga's page "1"'s page
And I <extra>
Then I should see /明日/ within that translation's japanese subsection
And I should see /tomorrow/ within that translation's english subsection
And I should see /Show\s*Edit\s*Del/ within that translation's links section
Examples:
| extra            |
| do nothing       |
| press "Create"   |

@arrows
Scenario: View of translation arrows
Given a translation: "1" exists with page: that page, pos: 1
And a translation: "2" exists with page: that page, pos: 2
And a translation: "3" exists with page: that page, pos: 3
When I go to that manga's page's page
Then I should see no up arrow within translation "1"
And I should see a down arrow within translation "1"
And I should see a up arrow within translation "2"
And I should see a down arrow within translation "2"
And I should see a up arrow within translation "3"
And I should see no down arrow within translation "3"

Scenario Outline: View of translations according to "active"
Given a translation: "1" exists with page: that page, pos: 1
And a translation: "2" exists with page: that page, pos: 2
And a translation: "3" exists with page: that page, pos: 3
When I go to that manga's page's page with "active=<a>"
Then I should see the top empty translation fillout as <c1>
And I should see translation "1" as <c2>
And I should see translation "2" as <c3>
And I should see translation "3" as <c4>
And I should see the translation form as <c5>
And I should see the bottom empty translation fillout as <c6>
Examples:
| a | c1           | c2           | c3           | c4           | c5           | c6           |
| 0 | inactive     | inactive     | inactive     | above-active | active       | below-active |
| 1 | above-active | active       | below-active | inactive     | inactive     | inactive     |
| 2 | inactive     | above-active | active       | below-active | inactive     | inactive     |
| 3 | inactive     | inactive     | above-active | active       | below-active | inactive     |

Scenario Outline: Links from within the translations at the show manga page
Given a translation: "1" exists with page: that page, pos: 1
When I go to that manga's page's page
When I follow "<link>" within that translation
Then I should be redirected to that <page> page
And the page should have <no> translations
Examples:
| link | page                              | no |
| Edit | manga's page's translation's edit |  1 |
| Del  | manga's page's                    |  0 |

# Scenario: Links at the bottom of the show manga page
#   When I follow "New page" at the bottom of the page
#   Then I should be redirected to that manga's new page page

@pending
Scenario: Something is wrong with the slug

@pending
Scenario: Make sure the right translation gets active after deletion
