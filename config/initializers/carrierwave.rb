CarrierWave.configure do |config|  
  config.fog_credentials = {
    provider:            'Rackspace',
    rackspace_username:  ENV['RACKSPACE_USERNAME'],
    rackspace_api_key:   ENV['RACKSPACE_API_KEY']
  }

  config.fog_directory = ENV['RACKSPACE_DIRECTORY'] #ENV['FOG_DIRECTORY']
  config.fog_host      = ENV['RACKSPACE_CDN_HOST']

  config.storage       = ENV['CARRIERWAVE_STORAGE'].to_sym
end