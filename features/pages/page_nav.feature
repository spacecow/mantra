Feature:
Background:
Given a manga exists
And a page: "1" exists with manga: that manga, no: 1
And a page: "3" exists with manga: that manga, no: 3
And a page: "4" exists with manga: that manga, no: 4
And a user exists with email: "test@example.com"
And I am logged in as "test@example.com"

Scenario Outline: View of the page nav
Given a translation exists with page: that page, pos: 1
When I go to that manga's <path> page
Then I should see /Previous\s*Next/ within the page nav section
Examples:
| path                      |
| page's                    |
| page's translation's edit |

Scenario Outline: Follow links in the page nav
Given a translation exists with page: page "3", pos: 1
When I go to that manga's <path> page
And I <extra>
And I follow "<link>" within the page nav section
Then I should be redirected to that manga's page "<no>"'s page
Examples:
| link     | no | extra      | path                          |
| Previous |  1 | do nothing | page "3"'s                    |
| Next     |  4 | do nothing | page "3"'s                    |
| Previous |  1 | do nothing | page "3"'s translation's edit |
| Next     |  4 | do nothing | page "3"'s translation's edit |

Scenario Outline: Follow links in the page nav on a rendered page
Given a translation exists with page: page "3", pos: 1
When I go to that manga's <path> page
And I fill in "Japanese" with ""
And I fill in "English" with ""
And I press "<label>"
And I follow "<link>" within the page nav section
Then I should be redirected to that manga's page "<no>"'s page
Examples:
| label  | link     | no | path                          |
| Create | Previous |  1 | page "3"'s                    |
| Create | Next     |  4 | page "3"'s                    |
| Update | Previous |  1 | page "3"'s translation's edit |
| Update | Next     |  4 | page "3"'s translation's edit |

Scenario Outline: The links in the page nav should not be activated if they do not lead somewhere
Given a translation exists with page: page "<no>", pos: 1
When I go to that manga's <path> page
Then I should see no link "<link1>" within the page nav section
And I should see a link "<link2>" within the page nav section
Examples:
| path                          | link1    | link2    | no |
| page "1"'s                    | Previous | Next     | 1  |
| page "4"'s                    | Next     | Previous | 4  |
| page "1"'s translation's edit | Previous | Next     | 1  |
| page "4"'s translation's edit | Next     | Previous | 4  |

Scenario Outline: The links in the page nav should not be activated if they do not lead somewhere on the rendered page
Given a translation exists with page: page "<no>", pos: 1
When I go to that manga's <path> page
And I fill in "Japanese" with ""
And I fill in "English" with ""
And I press "<label>"
Then I should see no link "<link1>" within the page nav section
And I should see a link "<link2>" within the page nav section
Examples:
| path                          | link1    | link2    | no | label  |
| page "1"'s                    | Previous | Next     |  1 | Create |
| page "4"'s                    | Next     | Previous |  4 | Create |
| page "1"'s translation's edit | Previous | Next     |  1 | Update |
| page "4"'s translation's edit | Next     | Previous |  4 | Update |
