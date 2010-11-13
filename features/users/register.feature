Feature: Register a user

Scenario: Register a user
When I go to the new user registration page
And I fill in "Email" with "test@email.com"
And I fill in "Password" with "foobar"
And I fill in "Password confirmation" with "foobar"
And I press "Sign up"
Then a user should exist with email: "test@email.com"
