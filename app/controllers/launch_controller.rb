class LaunchController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @story = Story.new
  end
end
