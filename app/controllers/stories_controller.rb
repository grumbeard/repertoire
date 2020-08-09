class StoriesController < ApplicationController
  def new
  end
  def index
    @stories = Story.all
  end
end
