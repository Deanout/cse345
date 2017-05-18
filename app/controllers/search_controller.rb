class SearchController < ApplicationController
  def search
    @events = Event.all
    if params[:search]
      @events = Event.search(params[:search]).order("created_at DESC")
    else
      @events = Event.all.order('created_at DESC')
    end
  end
end
