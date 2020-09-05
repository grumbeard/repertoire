class StoriesController < ApplicationController
  before_action :set_story, only: [:show, :edit, :ratings]

  def new
    @story = Story.new
  end

  def index
    @stories = Story.all
  end

  def create
    @story = Story.new(story_params)
    if @story.save
      redirect_to story_path(@story)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def ratings
  end

  private

  def story_params
    params.require(:story).permit(
      :story_id,
      :title,
      :photos,
      :latitude,
      :longitude,
      :price_rating,
      :worth_it,
      :mood_type,
      :experience_type,
      :ambience_type
    )
  end

  def set_story
    @story = Story.find(params[:id])
  end
end
