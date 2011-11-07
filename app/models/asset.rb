# == Schema Information
#
# Table name: assets
#
#  id              :integer         not null, primary key
#  type            :string(255)     not null
#  attachable_id   :integer         not null
#  attachable_type :string(255)     not null
#  asset_path      :string(255)     not null
#  content_type    :string(255)     not null
#  file_size       :string(255)     not null
#  title           :string(255)
#  description     :text
#  created_at      :datetime
#  updated_at      :datetime
#

class Asset < ActiveRecord::Base
  
  # Associations
  belongs_to :attachable, polymorphic: true
  
  # Validations
  #validates :image, presence: true
  
  # Callbacks
  before_save :update_asset_attributes


  
  private
  
  def update_asset_attributes
    if asset_path.present? && asset_path_changed?
      self.content_type = asset_path.file.content_type
      self.file_size = asset_path.file.size
    end
  end
  
end