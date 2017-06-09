class UsersController < ApplicationController
  def show
    if (current_user)
      @user = current_user
    else
      redirect_to root_path
    end
    @posts = Post.all.where(:user_id => current_user.id)
  end
end
