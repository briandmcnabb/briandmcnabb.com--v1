class Connection < ActiveRecord::Base
  # Accessors
  attr_accessible :provider, :username

  # Associations
  belongs_to :user
  
  # Validations
  validates :provider, presence: true
  validates :username, presence: true
  
  
  # Methods
  class << self
    def find_with_omniauth(omniauth)
      where(provider: omniauth.provider, uid: omniauth.uid).first
    end
    
    def create_with_omniauth(auth_hash)
      create do |connection|
        connection.provider = auth_hash.provider
        connection.uid = auth_hash.uid.to_s
        connection.username = auth_hash.info.urls.select { |k,v| v if v && v.include?(auth_hash.provider) }.values[0]
      end
    end
  end
  
end
