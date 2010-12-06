Then /^I should see \/([^\/]*)\/ within the (.+) (section) "([^"]*)"$/ do |text,section,tag,id|
  Then %(I should see /#{text}/ within #{tag} "#{section} ##{id}")
end
