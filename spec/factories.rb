Factory.define :manga do |f|
  f.sequence(:title) { |n| "Default factory title #{n}" }  
end

Factory.define :page do |f|
  f.no 1
  f.image_filename "jack.jpg"
end

Factory.define :translation do |f|
  f.english "Default factory english."
  f.x1 100
  f.y1 100
  f.x2 100
  f.y2 100
end

Factory.define :user do |f|
  f.password "foobar"
  f.password_confirmation "foobar"
end
