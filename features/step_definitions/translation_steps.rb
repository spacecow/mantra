Then /^I should see #{capture_model} as active$/ do |mdl|
  Then %(I should see no classes within section #{mdl})
end

Then /^I should see the translation form as active$/ do
  Then %(I should see no classes within the translation form section)
end

Then /^I should see the translation form as inactive$/ do
  Then %(I should see "non-active" classes within the translation form section)
end
