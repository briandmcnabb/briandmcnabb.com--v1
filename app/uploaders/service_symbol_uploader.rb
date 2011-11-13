# encoding: utf-8

class ServiceSymbolUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process uploaded file:
  process :resize_to_limit => [200, 200]

  # Create Thumbnail:
  version :thumb do
    process :resize_to_fill => [48, 48]
  end

  # Extension White List
  def extension_white_list
    %w(jpg jpeg gif png)
  end

end