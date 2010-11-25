Feature:
Background:
Given a manga: "Ashita no Joe" exists
And a page exists with no: "1", manga: that manga

Scenario Outline: Page no cannot be left blank
When I go to that manga's <page> page
And I fill in "Page no." with ""
And I press "<action>"
Then I should see page_no error /can't be blank/
Examples:
| page        | action |
| new page    | Create |
| page's edit | Update |

Scenario Outline: Page no must be unique inside a manga
Given a manga: "Violence Jack" exists
And a page: "anj2" exists with no: "2", manga: manga "Ashita no Joe"
And a page: "vj2" exists with no: "2", manga: manga "Violence Jack"
When I go to the manga: "<manga>"'s <page> page
And I fill in "Page no." with "1"
And I press "<action>"
Then I <view> see page_no error /is already taken/
Examples:
| page                | action | manga         | view       |
| new page            | Create | Ashita no Joe | should     |
| page: "anj2"'s edit | Update | Ashita no Joe | should     |
| new page            | Create | Violence Jack | should not |
| page: "vj2"'s edit  | Update | Violence Jack | should not |


