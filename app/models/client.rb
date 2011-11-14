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
  attr_accessible :organization, :first_name, :last_name, :email, :url, :description, :client_logo_attributes, :service_tokens
  attr_reader :service_tokens
  
  def service_tokens=(ids)
    self.service_ids = ids.split(",")
  end


  # Associations
  has_one :client_logo, as: :attachable, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_many :images, through: :projects
  has_and_belongs_to_many :services


  # Nested Models
  accepts_nested_attributes_for :client_logo, :reject_if => :all_blank, :allow_destroy => true


  # Methods
  def to_s
    self.organization
  end
end
