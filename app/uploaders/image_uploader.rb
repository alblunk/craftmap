# encoding: utf-8
require 'RMagick'

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  # https://github.com/carrierwaveuploader/carrierwave/wiki

  # random filenames
  # https://github.com/carrierwaveuploader/carrierwave/wiki/How-to%3A-Create-random-and-unique-filenames-for-all-versioned-files


  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :scale => [50, 50]
  # end


  def extension_white_list
    %w(jpg jpeg gif png)
  end

end

  # these are set in image_uploader initilizer
  # storage :fog
  # storage :file


  # if we want to save the content type to the db, need to add column, and include mime types
  # process :set_content_type

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # from file creation:
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  # storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:

  # def store_dir
  #   "public/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
    # %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end