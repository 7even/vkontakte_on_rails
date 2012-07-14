# encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :logged_in?
  
  def logged_in?
    session[:token].present?
  end
end
