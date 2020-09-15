class TagsController < ApplicationController
  before_action :set_story
  def new
  end

  def create
  end

  private

  def set_story
    @story = Story.find_by_id(params[:story_id])
  end
end
