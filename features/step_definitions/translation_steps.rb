Then /^I should see #{capture_model} as active$/ do |mdl|
  Then %(I should see no classes within section #{mdl})
end

Then /^I should see #{capture_model} as (above|below)\-active$/ do |mdl,cat|
  Then %(I should see "inactive #{cat}-active" classes within section #{mdl})
end

Then /^I should see #{capture_model} as inactive$/ do |mdl|
  Then %(I should see "inactive" classes within section #{mdl})
end

Then /^I should see the (translation form|bottom empty translation fillout|top empty translation fillout) as inactive$/ do |section|
  Then %(I should see "inactive" classes within the #{section} section)
end

Then /^I should see the (translation form|bottom empty translation fillout|top empty translation fillout) as (above|below)\-active$/ do |section,cat|
  Then %(I should see "inactive #{cat}-active" classes within the #{section} section)
end

Then /^I should see the translation form as active$/ do
  Then %(I should see no classes within the translation form section)
end

Then /^I should see (a|no) (up|down) arrow within #{capture_model}$/ do |pron,dir,mdl|
  with_scope("div##{get_scope(mdl)}") do
    page.send("has_#{get_pron(pron)}css?","span##{dir}_arrow a").should be_true
  end  
end

Then /^I should see no arrows within #{capture_model}$/ do |mdl|
  Then %(I should see no up arrow within #{mdl})
  And %(I should see no down arrow within #{mdl})
end

