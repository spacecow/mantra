Factory.define :manga do |f|
  f.sequence(:title) { |n| "Default factory title #{n}" }  
end

Factory.define :page do |f|
  f.no 1
end

Factory.define :translation do |f|
  f.english "Default factory english."
end

Factory.define :user do |f|
  f.password "foobar"
  f.password_confirmation "foobar"
end
