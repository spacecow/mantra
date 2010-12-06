CarrierWave.configure do |config|
  config.s3_access_key_id = ENV['AMAZON_ACCESS_KEY_ID']
  config.s3_secret_access_key = ENV['AMAZON_SECRET_ACCESS_KEY']
  config.s3_bucket = 'mantraupload'
end
