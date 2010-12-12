Given /^a notice is created with page: #{capture_model}, translation: #{capture_model}, message: "([^"]*)"$/ do |page,translation,text|
  translation = model(translation)
  create_model("a notice", "page: #{page}, translation_id: \"#{translation.id}\", message: \"#{text}\"")
end

Then /^I should see "([^"]*)" as the (\w*) notice$/ do |text,no|
  no = %w(first second third).index(no)+1
  Then %(I should see "#{text}" within "div#notice:nth-child(#{no})")
end

Given /^a history&notice is created with page: #{capture_model}, translation: #{capture_model}, message: "([^"]*)", category_mask: (\d+)$/ do |page, translation, text, category|
  Given %(a notice is created with page: #{page}, translation: #{translation}, message: "#{text}")
  Given %(a history exists with translation: #{translation}, message: "#{text}", category_mask: #{category})
end
