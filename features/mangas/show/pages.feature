Feature:
Background:
Given a manga exists
And a page exists with no: 1, manga: that manga
When I go to that manga's page

Scenario: View of translations on the show manga page
Then I should see "pages" table
| 1 | Show Edit Del |

Scenario Outline: Links from within the translations at the show manga page
When I follow "<link>" within that page
Then I should be redirected to that <page> page
And <no> pages should exist
Examples:
| link | page                | no |
| Edit | manga's page's edit |  1 |
| Show | manga's page's      |  1 |
| Del  | manga               |  0 |

Scenario: Links at the bottom of the show manga page
  When I follow "New page" at the bottom of the page
  Then I should be redirected to that manga's new page page
