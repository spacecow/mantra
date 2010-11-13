Feature:
Background:
Given a manga exists
And a page: "1" exists with manga: that manga, no: 1
And a page: "2" exists with manga: that manga, no: 2

Scenario Outline: View of translation section
Given a translation exists with page: page "<page>", pos: 1
When I go to that manga's page "1"'s page
Then I should see <pron> "translations" section
Examples:
| page | pron |
|    1 | a    |
|    2 | no   |

@arrows
Scenario: View of translation arrows
Given a translation: "1" exists with page: that page, pos: 1
And a translation: "2" exists with page: that page, pos: 2
And a translation: "3" exists with page: that page, pos: 3
When I go to that manga's page's page
Then I should see no "up_arrow" sub-section within translation "1"
And I should see a "down_arrow" sub-section within translation "1"
And I should see a "up_arrow" sub-section within translation "2"
And I should see a "down_arrow" sub-section within translation "2"
And I should see a "up_arrow" sub-section within translation "3"
And I should see no "down_arrow" sub-section within translation "3"




Scenario Outline: View of translations according to "active"
Given a translation: "1" exists with page: that page, pos: 1
And a translation: "2" exists with page: that page, pos: 2
And a translation: "3" exists with page: that page, pos: 3
And a translation: "4" exists with page: that page, pos: 4
When I go to that manga's page's page with "active=<a>"
And I should see "<c1>" classes within translation "1"
And I should see "<c2>" classes within translation "2"
And I should see "<c3>" classes within translation "3"
And I should see "<c4>" classes within translation "4"
Examples:
| a | c1                      | c2                      | c3                      | c4                      |
| 1 |                         | non-active below-active | non-active              | non-active              |
| 2 | non-active above-active |                         | non-active below-active | non-active              |
| 3 | non-active              | non-active above-active |                         | non-active below-active |
| 4 | non-active              | non-active              | non-active above-active |                         |
# | a  | 1                       |
# | c1 |                         |
# | c2 | non-active below-active |
# | c3 | non-active              |
# | c4 | non-active              |


# Scenario Outline: Links from within the translations at the show manga page
# When I follow "<link>" within that page
# Then I should be redirected to that <page> page
# And <no> pages should exist
# Examples:
# | link | page                | no |
# | Edit | manga's page's edit |  1 |
# | Show | manga's page's      |  1 |
# | Del  | manga               |  0 |

# Scenario: Links at the bottom of the show manga page
#   When I follow "New page" at the bottom of the page
#   Then I should be redirected to that manga's new page page
