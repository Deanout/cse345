class HomeController < ApplicationController
  def index
    @events = Event.all.order("created_at DESC")
    @events = @events.last(2).reverse
    @posts = Post.all.order("created_at DESC")
    @posts = @posts.last(10).reverse
  end
end
