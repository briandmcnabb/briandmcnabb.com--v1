# == Schema Information
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  first_name         :string(255)
#  last_name          :string(255)
#  description        :text
#  email              :string(255)     default(""), not null
#  encrypted_password :string(128)     default(""), not null
#  sign_in_count      :integer         default(0)
#  current_sign_in_at :datetime
#  last_sign_in_at    :datetime
#  current_sign_in_ip :string(255)
#  last_sign_in_ip    :string(255)
#  failed_attempts    :integer         default(0)
#  unlock_token       :string(255)
#  locked_at          :datetime
#  created_at         :datetime
#  updated_at         :datetime
#

class User < ActiveRecord::Base
  # Accessors
  attr_accessible :email, :password, :password_confirmation, :first_name, :last_name, :description, :avatar_attributes, :resume_attributes
  
  # Devise Modules
  devise :database_authenticatable, :trackable, :validatable, :timeoutable, :lockable, :registerable
  
  # Associations
  has_one   :avatar, :as => :attachable, :dependent => :destroy
  has_one   :resume, :as => :attachable, :dependent => :destroy
  has_many  :posts, :dependent => :destroy
  has_many  :projects, :dependent => :destroy
  has_many  :clients, :through => :projects, :dependent => :destroy
  has_many  :skills, :dependent => :destroy
  has_many  :services, :through => :skills, :dependent => :destroy

  # Nested Models
  accepts_nested_attributes_for :avatar, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :resume, :reject_if => :all_blank, :allow_destroy => true  
    

    
  def to_s
    self.first_name || self.last_name ? "#{self.first_name} #{self.last_name}" : self.email
  end
  
  def full_name
    [first_name, last_name].join(' ')
  end
end
