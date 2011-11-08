# == Schema Information
#
# Table name: services
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Service < ActiveRecord::Base
  # Accessors
  attr_accessible :name, :description, :service_symbol_attributes, :skills_attributes

  # Associations
  has_one  :service_symbol, :as => :attachable, :dependent => :destroy
  has_many :skills, :dependent => :destroy

  # Nested Models
  accepts_nested_attributes_for :service_symbol, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :skills, :reject_if => :all_blank, :allow_destroy => true
  
end