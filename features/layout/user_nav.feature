Feature: User nav view
Background:
Given a user exists with email: "user@email.com"

Scenario: User nav with no user signed in
When I go to the home page
Then I should see /Sign up or sign in\./ within the user nav section

Scenario: User nav with a user signed in
Given I am logged in as "user@email.com"
When I go to the home page
Then I should see /Signed in as user@email\.com\. Not you\? Sign out./ within the user nav section

Scenario Outline: Follow the link in the user nav when no user is logged in
When I go to the home page
And I follow "<link>" within the user nav section
Then I should be redirected to the <path> page
Examples:
| link    | path                  |
| Sign up | new user registration |
| sign in | new user session      |

Scenario: Follow the link in the user nav when a user is logged in
Given I am logged in as "user@email.com"
When I go to the home page
And I follow "Sign out" within the user nav section
Then I should be redirected to the home page
