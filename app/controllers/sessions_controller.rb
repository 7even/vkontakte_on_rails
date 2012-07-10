class SessionsController < ApplicationController
  def new
    @vk_url = VkontakteApi.authorization_url(scope: [:friends, :groups])
  end
  
  def callback
    @vk = VkontakteApi.authorize(code: params[:code])
    session[:token] = @vk.token
    
    redirect_to root_url
  end
  
  def destroy
    session[:token] = nil
    redirect_to root_url
  end
end
