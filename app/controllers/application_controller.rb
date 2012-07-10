# encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :logged_in?
  
  def logged_in?
    session[:token].present?
  end
  
  def authenticate_user!
    redirect_to login_url, alert: 'Необходимо авторизоваться!' unless logged_in?
  end
end
