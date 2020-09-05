class TaggingsController < ApplicationController
  def index
    @story = Story.find_by_id(params[:id])
    @taggings = Tagging.where(story_id: @story.id)
  end

  def create
    @tagging = Tagging.new
    @story = Story.find_by_id(params[:id])
    if @tagging.save
      redirect_to story_tagging_index_path(@story)
    else
      render 'new'
    end
  end
end
