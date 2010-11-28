Given /^#{capture_model} has #{capture_model}(?: with #{capture_fields})?$/ do |parent,child,fields|
  factory, label = *parse_model(child)
  fields = parse_fields(fields)
  record = model(parent).translations.create!(fields)
  store_model(factory, label, record)
end

Then /^#{capture_model} should have #{capture_model}(?: with #{capture_fields})?$/ do |parent,child,fields|
  factory, label = *parse_model(child)
  find_model_through!(parent, child, fields)
end
