# == Schema Information
#
# Table name: skills
#
#  id         :integer         not null, primary key
#  position   :integer
#  name       :string(255)
#  user_id    :integer
#  service_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Skill < ActiveRecord::Base
  acts_as_list
  
  # Accessors
  attr_accessible :position, :name

  # Associations
  belongs_to :user
  belongs_to :service
  
  # Scopes
  default_scope order: 'position'
  
end
