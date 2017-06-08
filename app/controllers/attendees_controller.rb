class AttendeesController < ApplicationController
  before_action :set_event
  def register
    @user = @event.attendees.create(:user_id => params[:user_id])
    respond_to do |format|
      format.js
      format.html { redirect_to :back, notice: "Successfully registered for the event for #{current_user}!"}
    end
  end

  def deregister
    @event.attendees.delete(params[:user_id])
    respond_to do |format|
      format.js
      format.html { redirect_to :back, notice: "Successfully deregistered for the event!"}
    end
  end
  private
  def set_event
    @event = Event.find(params[:event_id])
  end
end
