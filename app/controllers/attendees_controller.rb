class AttendeesController < ApplicationController
  before_action :set_event
  def register
    @user = @event.attendees.create(:user_id => params[:user_id])
    respond_to do |format|
      format.js
      format.html { redirect_to :back, notice: "You successfully registered for the event, #{current_user.username}!"}
    end
  end

  def deregister
    @event.attendees.where(:user_id => params[:user_id]).destroy_all
    respond_to do |format|
      format.js
      format.html { redirect_to :back, notice: "You successfully deregistered for the event, #{current_user.username}!"}
    end
  end
  private
  def set_event
    @event = Event.find(params[:event_id])
  end
end
