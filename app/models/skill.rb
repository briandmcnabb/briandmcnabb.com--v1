# == Schema Information
#
# Table name: skills
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  user_id    :integer
#  service_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Skill < ActiveRecord::Base
  belongs_to :user
  belongs_to :service
  
 attr_accessible :name
end