Feature:
Background:
Given a manga exists
And a page exists with no: "1", manga: that manga

Scenario Outline: Page no cannot be left blank
When I go to that manga's <page> page
And I fill in "Page no." with ""
And I press "<action> Page"
Then I should see page_no error /can't be blank/
Examples:
| page        | action |
| new page    | Create |
| page's edit | Update |

Scenario Outline: Page no must be unique
Given a page exists with no: "2", manga: that manga
When I go to that manga's <page> page
When I fill in "Page no." with "1"
And I press "<action> Page"
Then I should see page_no error /is already taken/
Examples:
| page        | action |
| new page    | Create |
| page's edit | Update |
