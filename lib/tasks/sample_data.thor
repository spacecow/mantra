require 'faker'

namespace :do do
  desc "Fill database with sample data"
  task :populate => :environment do
    #Rake::Task['db:reset'].invoke
    100.times do |n|
      name = Faker::Name.name
      Manga.create!(:title => name)
    end
  end
end
