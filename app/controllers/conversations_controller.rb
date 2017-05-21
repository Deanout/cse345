class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
    # Can also grab inbox, trash, sent instead of just all conversations
    # @conversations = current_user.mailbox.conversations
    @mailbox = current_user.mailbox
    @sent = @mailbox.sentbox
    @trash = @mailbox.trash
    @conversations = @mailbox.inbox

  end

  def show
    @conversation = current_user.mailbox.conversations.find(params[:id])
    @conversation.messages.each do |message|
      message.mark_as_read(current_user)
    end
  end

  def new
    @recipients = User.all - [current_user]
  end
  def create
    recipient = User.find(params[:user_id])
    receipt = current_user.send_message(recipient, params[:body], params[:subject])
    redirect_to conversation_path(receipt.conversation)
  end
end
