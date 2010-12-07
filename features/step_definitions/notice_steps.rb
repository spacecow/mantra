Given /^a notice is created with page: #{capture_model}, translation: #{capture_model}$/ do |page,translation|
  translation = model(translation)
  create_model("a notice", "page: #{page}, translation_id: \"#{translation.id}\"")
end
