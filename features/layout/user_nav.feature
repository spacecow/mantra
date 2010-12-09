Feature: User nav view
Background:
Given a user exists with email: "user@email.com"

Scenario: User nav with no user signed in
When I go to the home page
Then I should see /Or sign in with email/ within the user nav section

Scenario: User nav with a user signed in
Given I am logged in as "user@email.com"
When I go to the home page
Then I should see /Signed in as user@email\.com\. Not you\? Sign out\./ within the signed_in section

Scenario: Sign in a user
When I go to the home page
And I follow "sign in" within the user nav section
Then I should be redirected to the new user session page

Scenario: Sign out a user
Given I am logged in as "user@email.com"
When I go to the home page
And I follow "Sign out" within the signed_in section
Then I should be redirected to the home page
