@new @view @page
Feature:
Background:
Given a manga exists with title: "Ashita no Joe"
And a page exists with no: "1", manga: that manga
When I go to the manga's page's edit page
And a user exists with email: "test@example.com"
And I am logged in as "test@example.com"
  
@default
Scenario: Edit page view
Then I should see /Edit Page/ as title
And the "Page no." field should contain "1"
And I should see links "Show Delete" at the bottom of the page

@links
Scenario Outline: Links on the bottom of the new page
When I follow "<link>" at the <location> of the page
Then I should be redirected to that <page> page
And <no> pages should exist
Examples:
| link          | location | page           | no |
| Show          | bottom   | manga's page's |  1 |
| Delete        | bottom   | manga's        |  0 |

@site_nav @links
Scenario: Links in the site nav section
When I follow "Ashita no Joe" within the site nav section
Then I should be redirected to that manga's page
