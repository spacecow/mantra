# Comment out this in the feature/suppert/env.rb file
# if defined?(ActiveRecord::Base)
#   begin
#     require 'database_cleaner'
#     DatabaseCleaner.strategy = :truncation
#   rescue LoadError => ignore_if_database_cleaner_not_present
#   end
# end

# # DB Cleaner currently being used for AR
# Mongoid.master.collections.select do |collection|
#   collection.name !~ /system/
# end.each(&:drop)

# DatabaseCleaner.strategy = :truncation

# Before do |scenario|
#   DatabaseCleaner.start
# end

# After do |scenario|
#   p scenario.failed?
#   p Manga.count
#   DatabaseCleaner.clean
# end

After do |scenario|
#  puts "cleaning mongodb...."
  Mongoid.database.collections.each do |collection|
    unless collection.name =~ /^system\./
      collection.remove
    end
  end
#  puts "finished cleaning mongodb."
end
