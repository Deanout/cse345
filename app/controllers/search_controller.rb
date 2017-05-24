class SearchController < ApplicationController
  def search
    @events = Event.all
    @posts = Post.all
    @tags = Tag.all
    if params[:search]
      @events = Event.search(params[:search])
      @posts = Post.search(params[:search])

      if @events.count > 0
        @results = @events
        if @posts.count > 0
          @results = (@events + @posts).sort(&:created_at)
        else
        end
      elsif @posts.count > 0
        @results = @posts
      end
    else
      @eposts = @events.merge(@posts)
      @results = @eposts.merge(@tags).order('created_at DESC')
    end
  end
end
