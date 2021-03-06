class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?
    after_filter :user_activity

    def is_admin?
        true if current_user.admin?
    end

    def is_admin!
        if current_user.nil?
            redirect_to new_user_session_path
        elsif !current_user.admin?
            redirect_to root_path, notice: "You ain't no admin. Run fool."
        end
  end

    helper_method :is_admin!
    helper_method :is_admin?

    protected

    def configure_permitted_parameters
        added_attrs = [:username, :email, :password, :password_confirmation, :remember_me, :avatar, :student_id]
        devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
        devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end
    private

    def user_activity
      current_user.try :touch
    end
end
