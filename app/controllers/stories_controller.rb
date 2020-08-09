class StoriesController < ApplicationController
  def new
    @story = Story.new
  end
  def index
    @stories = Story.all
  end
end
