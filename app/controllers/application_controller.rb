class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #   helper_method simply makes the passed in arguments available as helper methods in the views.
  #   This means we can call both current_user and logged_in? from the views.
  helper_method :current_user, :logged_in?
  before_action :set_nav_categories

  def login(user)
    session[:user_id] = user.id
  end

  def current_user
    if session[:id]
      @current_user ||= User.find(session[:id])
    else
      @current_user = nil
    end
  end

  def logout
    session.delete(:user_id)
    @current_user = nil
  end

  def logged_in?
    current_user.nil? ? false : true
  end

  def authenticate_user
    flash[:alert] = 'Kindly log in first...'
    redirect_to sessions_path if session[:id].nil?
  end

  def set_nav_categories
    @nav_categories = Category.order(:priority).limit(4)
  end
end
