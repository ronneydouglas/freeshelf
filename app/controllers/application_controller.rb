class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
     @current_user ||= User.find_by id: session[:user_id]
  end

  def authorize
     unless current_user
        redirect_to new_user_path
     end
  end
end
