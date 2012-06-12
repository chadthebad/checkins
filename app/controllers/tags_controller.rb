class TagsController < ApplicationController

  def new
    @tag = Tag.new(:checkin_name => params[:checkin_name])
  end

  def create
    if params[:tag][:tag_name].present?
      tag = Tag.new(params[:tag])
      tag.save
    end

    redirect_to "/static/list"
  end

  def index

  end
end