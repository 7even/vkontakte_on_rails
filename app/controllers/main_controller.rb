class MainController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    vk = VkontakteApi::Client.new(session[:token])
    @friends = vk.friends.get(fields: [:first_name, :last_name, :screen_name, :photo, :education])
  end
end
