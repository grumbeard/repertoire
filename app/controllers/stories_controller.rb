class StoriesController < ApplicationController
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
    @story = Story.find_by_id(params[:id])
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
end
