class Connection < ActiveRecord::Base
  # Accessors
  attr_accessible :provider, :uid, :username

  # Associations
  belongs_to :user
  
end
