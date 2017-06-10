class UserController < ApplicationController
  before_action :expire
  def show
    if (current_user)
      @user = current_user
      @posts = Post.all.where(:user_id => current_user.id)
    else
      redirect_to root_path
    end
  end
  private
  def expire
    Post.expire
  end
end
