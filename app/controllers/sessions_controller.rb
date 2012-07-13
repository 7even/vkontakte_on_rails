class SessionsController < ApplicationController
  def new
    @vk_url = VkontakteApi.authorization_url(scope: [:friends, :groups])
  end
  
  def callback
    @vk = VkontakteApi.authorize(code: params[:code])
    session[:token] = @vk.token
    session[:vk_id] = @vk.user_id
    
    redirect_to root_url
  end
  
  def destroy
    session[:token] = nil
    session[:vk_id] = nil
    
    redirect_to root_url
  end
end
