class TaggingsController < ApplicationController
  before_action :set_story
  before_action :set_experience_taggings, only: [:index]
  before_action :set_location_taggings, only: [:index]
  before_action :set_other_taggings, only: [:index]

  def index
    @tagged_tag_names = []
    @tagged_tag_names.concat(get_tag_names(@mood_taggings))
    @tagged_tag_names.concat(get_tag_names(@feeling_taggings))
    @tagged_tag_names.concat(get_tag_names(@ambience_taggings))
    @tagged_tag_names.concat(get_tag_names(@location_taggings))
    @tagged_tag_names.concat(get_tag_names(@other_taggings))
    @untagged = Tag.where.not(name: @tagged_tag_names)
  end

  def destroy
    @tagging = Tagging.find_by_id(params[:id])
    @tagging.destroy
    redirect_to story_taggings_path(@story), notice: "Tag deleted"
  end

  def create
    @tagging = Tagging.new(story: @story, tag: Tag.find_by_id(params[:tag_id]))
    if @tagging.save
      redirect_to story_taggings_path(@story), notice: "Tag added"
    else
      redirect_to story_taggings_path(@story), notice: "Tagging unsuccessful"
    end
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

  def get_tag_names(taggings)
    tag_names = []
    taggings.each { |tags| tag_names << tags.tag.name }
  end
end
