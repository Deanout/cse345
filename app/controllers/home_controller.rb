class HomeController < ApplicationController
  before_action :expire
  def index
    @events = Event.all.order("created_at ASC")
    @events = @events.last(2).reverse
    @posts = Post.all.order("created_at ASC")
    @posts = @posts.last(10).reverse
  end
  private
  def expire
    Post.expire
  end
end
