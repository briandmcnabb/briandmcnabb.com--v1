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
  # Associations
  has_one :image, :as => :attachable
  has_many :projects

  # Nested Models
  accepts_nested_attributes_for :image, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :projects, :reject_if => :all_blank, :allow_destroy => true


  def to_s
    self.organization
  end
end
