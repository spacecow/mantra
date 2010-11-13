Factory.define :manga do |f|
  f.title "Default factory title."
end

Factory.define :page do |f|
  f.no 1
end

Factory.define :user do |f|
  f.password "foobar"
  f.password_confirmation "foobar"
end
