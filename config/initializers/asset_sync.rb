AssetSync.configure do |config|
  config.fog_provider       = 'Rackspace'
  config.fog_directory      = ENV['RACKSPACE_DIRECTORY'] #ENV['FOG_DIRECTORY']
  
  config.rackspace_username = ENV['RACKSPACE_USERNAME']
  config.rackspace_api_key  = ENV['RACKSPACE_API_KEY']
  
  config.gzip_compression   = true
  
  config.fail_silently      = true
end