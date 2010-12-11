Feature:
Background:
Given a manga exists
And a page "1" exists with no: 1, manga: that manga
And a user exists with email: "test@example.com"
And I am logged in as "test@example.com"

Scenario: View of translations on the show manga page
When I go to that manga's page
Then I should see "pages" table
| 1 | Show Edit Del |

Scenario Outline: Links from within the translations at the show manga page
When I go to that manga's page
And I follow "<link>" within that page
Then I should be redirected to that <page> page
And <no> pages should exist
Examples:
| link | page                | no |
| Edit | manga's page's edit |  1 |
| Del  | manga               |  0 |
| Show | manga's page's      |  1 |

Scenario: Links at the bottom of the show manga page
When I go to that manga's page
And I follow "New page" at the bottom of the page
Then I should be redirected to that manga's new page page

Scenario: If a page is deleted, all its notices should also die
Given a translation exists with page: page "1", pos: 1
And a notice is created with page: page "1", translation: that translation, message: "Some message"
When I go to that manga's page
And I follow "Del" within that page
Then 0 notices should exist
