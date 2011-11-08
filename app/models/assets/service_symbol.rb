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

class ServiceSymbol < Asset
  mount_uploader :asset_path, ServiceSymbolUploader
end