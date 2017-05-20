class ConversationsController < ApplicationController
  before_action :authenticate_user!
  def index
    # Can also grab inbox, trash, sent instead of just all conversations
    @conversations = current_user.mailbox.conversations
  end
  def show
    @conversation = current_user.mailbox.conversations.find(params[:id])
  end
end
