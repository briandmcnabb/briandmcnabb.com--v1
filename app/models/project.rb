# == Schema Information
#
# Table name: projects
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  description :text
#  url         :string(255)
#  user_id     :integer
#  client_id   :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Project < ActiveRecord::Base
  # Accessors
  attr_accessible :title, :description, :url, :client_id, :images_attributes

  # Associations
  belongs_to :user
  belongs_to :client
  has_many :images, :as => :attachable, :dependent => :destroy

  # Nested Models
  accepts_nested_attributes_for :images, :reject_if => :all_blank, :allow_destroy => true
  
end
