Then /^I should see the (\w*) general history as active$/ do |no|
  page.has_css?("div#histories div#general a:nth-child(#{get_no no}).active")
end
