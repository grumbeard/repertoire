class TaggingsController < ApplicationController
  before_action :set_story
  before_action :set_experience_taggings, only: [:index]
  before_action :set_location_taggings, only: [:index]
  before_action :set_other_taggings, only: [:index]

  def destroy
    byebug
    @tagging = Tagging.find_by_id(params[:id])
    @tagging.destroy
    redirect_to story_taggings_path(@story)
  end

  def create
    # @tagging = Tagging.new(story: @story, tag: @tag)
    # if @tagging.save
    #   redirect_to story_tagging_index_path(@story)
    # else
    #   render 'new'
    # end
  end

  private

  def set_story
    @story = Story.find_by_id(params[:story_id])
  end

  def set_experience_taggings
    @mood_taggings = Tagging.where({story: @story, tag: Tag.where(tag_category: TagCategory.where(name: 'Mood'))})
    @feeling_taggings = Tagging.where({story: @story, tag: Tag.where(tag_category: TagCategory.where(name: 'Feeling'))})
    @ambience_taggings = Tagging.where({story: @story, tag: Tag.where(tag_category: TagCategory.where(name: 'Ambience'))})
  end

  def set_location_taggings
    @location_taggings = Tagging.where({story: @story, tag: Tag.where(tag_category: TagCategory.where(name: 'Location'))})
  end

  def set_other_taggings
    @other_taggings = Tagging.where({story: @story, tag: Tag.where(tag_category: TagCategory.where(name: 'Other'))})
  end
end
