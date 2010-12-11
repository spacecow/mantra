@mangas
Feature:
Background:
Given a manga exists with title: "Ashita no Joe"
And a user exists with email: "test@example.com"

@list
Scenario: List mangas
Given I am logged in as "test@example.com"
When I go to the mangas page
Then I should see "mangas" table
| Ashita no Joe | Edit Del |

@links
Scenario Outline: Links within a manga
Given I am logged in as "test@example.com"
When I go to the mangas page
And I follow "<link>" within that manga
Then I should be redirected to the <page> page
And <no> mangas should exist
Examples:
| link          | page         | no |
| Ashita no Joe | manga's      | 1  |
| Edit          | manga's edit | 1  |
| Del           | mangas       | 0  |

Scenario: View for guest
When I go to the mangas page
Then I should see "mangas" table
| Ashita no Joe |
And I should see no link "Ashita no Joe" within the mangas table
And I should see no links at the bottom of the page

Scenario: When deleting a manga, all pages and its notices also die
Given a page "1" exists with manga: that manga
And a page "2" exists with manga: that manga
And a translation "1" exists with page: page "1", pos: 1
And a translation "2" exists with page: page "2", pos: 1
And a notice is created with page: page "1", translation: translation "1", message: "Some message"
And a notice is created with page: page "2", translation: translation "2", message: "Some other message"
And I am logged in as that user
When I go to the mangas page
And I follow "Del" within that manga
Then 0 notices should exist
