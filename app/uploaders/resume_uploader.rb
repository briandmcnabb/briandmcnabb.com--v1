# encoding: utf-8

class ResumeUploader < CarrierWave::Uploader::Base

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{model.id}"
  end

  # Extension White List
  def extension_white_list
    %w(pdf)
  end

end