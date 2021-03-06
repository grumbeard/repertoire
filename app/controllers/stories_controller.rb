class StoriesController < ApplicationController
  before_action :set_story, only: [:show, :edit, :update, :destroy, :experience, :pricing]
  before_action :set_experience_taggings, only: [:show]
  before_action :set_location_taggings, only: [:show]
  before_action :set_other_taggings, only: [:show]

  def new
    @story = Story.new
  end

  def index
    @stories = Story.where(user: current_user)
  end

  def create
    @story = Story.new(story_params)
    @story.user = current_user
    address_details = []
    #Use Geocoder to autotag location info
    results = Geocoder.search([@story.latitude, @story.longitude])
    if results.present?
      address_details << results.first.street if results.first.street
      address_details << results.first.neighbourhood if results.first.neighbourhood
      address_details << results.first.suburb if results.first.suburb
      address_details.each do |value|
        tag = Tag.new(name: value, tag_category: TagCategory.where(name: 'Location').first) unless Tag.where(name: value).present?
        tag.save if tag
        tagging = Tagging.new(story: @story, tag: Tag.where(name: value).first)
        tagging.save if tagging
      end
    end
    if @story.save
      redirect_to story_path(@story)
    else
      render 'new'
    end
  end

  def update
    if @story.update(story_params)
      redirect_to story_path(@story)
    else
      redirect_to edit_story_path(@story)
    end
  end

  def destroy
    @story.destroy
    redirect_to stories_path
  end

  def experience
    @mood_tags = Tag.where(tag_category: TagCategory.where(name: 'Mood'))
    @feeling_tags = Tag.where(tag_category: TagCategory.where(name: 'Feeling'))
    @ambience_tags = Tag.where(tag_category: TagCategory.where(name: 'Ambience'))
  end

  private

  def story_params
    params.require(:story).permit(
      :user_id,
      :title,
      :latitude,
      :longitude,
      :price_rating,
      :worth_it,
      :mood_type,
      :feeling_type,
      :ambience_type,
      photos: []
    )
  end

  def set_story
    @story = Story.find(params[:id])
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
