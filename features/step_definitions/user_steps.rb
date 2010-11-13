Given /^I am logged in as "([^"]*)"$/ do |user|
  When %(I go to the new user session page)
  And %(I fill in "Email" with "#{user}")
  And %(I fill in "Password" with "foobar")
  And %(I press "Sign in")
end
