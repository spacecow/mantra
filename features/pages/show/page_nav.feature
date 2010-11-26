Feature:
Background:
Given a manga exists
And a page: "1" exists with manga: that manga, no: 1
And a page: "3" exists with manga: that manga, no: 3
And a page: "4" exists with manga: that manga, no: 4


Scenario: View of the page nav
When I go to that manga's page's page
Then I should see /Previous\s*Next/ within the page nav section

Scenario: Follow links in the page nav
When I go to that manga's page "3"'s page
And I follow "Previous" within the page nav section
Then I should be redirected to that manga's page "1"'s page


@pending
Scenario: The links in the page nav should not be activated if they do not lead somewhere
