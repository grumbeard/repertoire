class TagsController < ApplicationController
  before_action :set_story, only: [:new, :create]
  before_action :set_tag, only: [:edit, :update]
  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new
    @tag_category = TagCategory.find_by_id(params[:tag_category])
    @tag.tag_category = @tag_category
    if @tag.save
      tagging = Tagging.new(tag: @tag, story: @story)
      if tagging.save
        redirect_to edit_tag_path(@tag)
      else
        @tag.destroy
        render 'new'
      end
    else
      render 'new'
    end
  end

  def update
    if @tag.update(tag_params)
      render story_taggings_path(Story.find_by_id(@tag.taggings.last.story))
    else
      render edit_tag_path(@tag)
    end
  end

  private

  def set_story
    @story = Story.find_by_id(params[:story_id])
  end

  def set_tag
    @tag = Tag.find_by_id(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:name)
  end
end
