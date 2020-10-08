class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def login(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logout
    session.delete(:user_id)
    @current_user = nil
  end

  def logged_in?
    current_user.nil? ? false : true
  end
  #   helper_method simply makes the passed in arguments available as helper methods in the views.
  #   This means we can call both current_user and logged_in? from the views.
  helper_method :current_user, :logged_in?
end
