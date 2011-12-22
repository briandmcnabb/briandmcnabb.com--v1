class Connection < ActiveRecord::Base
  # Accessors
  attr_accessible :provider, :url

  # Associations
  belongs_to :user
  
  # Validations
  validates :provider, presence: true
  validates :username, presence: true
  validates :url,      presence: true
  
  # Callbacks
  before_validation(:on => :create) do
    self.username ||= self.url.split('/').last
  end
  
  
  # Methods
  
  class << self
    def find_with_omniauth(omniauth)
      where(provider: omniauth.provider, uid: omniauth.uid).first
    end
    
    def create_with_omniauth(auth_hash)
      create do |c|
        c.provider = auth_hash.provider
        c.uid      = auth_hash.uid.to_s
        c.url      = auth_hash.info.urls.select { |k,v| v if v && v.include?(auth_hash.provider) }.values[0]
        c.username = auth_hash.info.nickname
      end
    end
  end
  
end
