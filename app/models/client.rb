# == Schema Information
#
# Table name: clients
#
#  id           :integer         not null, primary key
#  organization :string(255)
#  first_name   :string(255)
#  last_name    :string(255)
#  email        :string(255)
#  url          :string(255)
#  description  :text
#  created_at   :datetime
#  updated_at   :datetime
#

class Client < ActiveRecord::Base
  # Accessors
  attr_accessible :first_name, :last_name, :email, :url, :description, :client_logo_attributes, :project_attributes

  # Associations
  has_one :client_logo, :as => :attachable
  has_many :projects

  # Nested Models
  accepts_nested_attributes_for :client_logo, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :projects, :reject_if => :all_blank, :allow_destroy => true


  def to_s
    self.organization
  end
end
