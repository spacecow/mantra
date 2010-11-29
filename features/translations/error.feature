Feature: Translation errors
Background:
Given a manga exists
And a page: "1" exists with manga: that manga, no: 1
And a page: "2" exists with manga: that manga, no: 2

Scenario Outline: Both Japanese and English cannot be blank
Given a translation exists with page: that page, pos: 1
When I go to the manga's <path> page
And I fill in "English" with ""
And I fill in "Japanese" with ""
And I press "<button>"
Then I should see english error /both can't be blank/
And I should not see japanese error /both can't be blank/
Examples:
| path                          | button |
| page's                        | Create |
| page's translation's edit     | Update |

Scenario Outline: The new translation form should be active
Given a translation exists with page: page "2", pos: 1
When I go to the manga's page "<no>"'s page
And I press "Create"
Then I should see the translation form as active
And I should see the top empty translation fillout as <status>
And I should see the bottom empty translation fillout as below-active
Examples:
| no | status       |
|  1 | above-active |
|  2 | inactive     |

@pending
Scenario: Implement javascript activation  
