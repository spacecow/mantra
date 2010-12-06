require 'fancy-buttons'
# This configuration file works with both the Compass command line tool and within Rails.
# Require any additional compass plugins here.
project_type = :rails
project_path = Compass::AppIntegration::Rails.root
# Set this to the root of your project when deployed:
http_path = "/"
sass_dir = "app/stylesheets"
environment = Compass::AppIntegration::Rails.env
# To enable relative paths to assets via compass helper functions. Uncomment:
# relative_assets = true

if ENV['RAILS_ENV'] == "production"
  css_dir = "tmp/stylesheets/compiled"
  Rails.configuration.middleware.insert_after 'Sass::Plugin::Rack', 'Rack::Static', :urls => ['/stylesheets/compiled'], :root => "#{project_path}/tmp"
else
  css_dir = "public/stylesheets"
end  


