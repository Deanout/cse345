class SearchController < ApplicationController
  def search
    @events = Event.all
    @posts = Post.all
    @tags = Tag.all
    if params[:search]
      @events = Event.search(params[:search]).order("created_at DESC")
      @posts = Post.search(params[:search]).order("created_at DESC")
      @tags = Tag.search(params[:search]).order("created_at DESC")
    else
      @events = @events.order('created_at DESC')
      @posts = @posts.order('created_at DESC')
      @tags = @tags.order('created_at DESC')
    end
  end
end
