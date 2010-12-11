Given /^I am logged in as "([^"]*)"$/ do |user|
  When %(I go to the new user session page)
  And %(I fill in "Email" with "#{user}")
  And %(I fill in "Password" with "foobar")
  And %(I press "Sign in")
end

Given /^I am logged in as #{capture_model}$/ do |user|
  user = model(user)
  Given %(I am logged in as "#{user.email}")
end

When /^I do nothing$/ do
end
