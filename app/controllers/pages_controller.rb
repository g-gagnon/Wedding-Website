class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:rsvp, :code]

  PHOTOS_FOLDER = %w(engagement_shoot venue)

  def photos
    @photos = {}

    PHOTOS_FOLDER.each do |folder|
      files = Dir.glob("app/assets/images/#{folder}/*.*").map { |file| File.basename file, ".*" }
      @photos[folder] = files.sort
    end
  end

end