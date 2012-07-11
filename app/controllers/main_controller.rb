class MainController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    vk = VkontakteApi::Client.new(session[:token])
    @friends = vk.friends.get(fields: [:first_name, :last_name, :screen_name, :sex, :photo, :education, :last_seen])
    
    raw_feed = vk.newsfeed.get(filters: 'post')
    @newsfeed = process_feed(raw_feed)
  end
  
private
  def process_feed(raw_feed)
    users = raw_feed.profiles.inject({}) do |hash, user|
      hash[user.uid] = user
      hash
    end
    groups = raw_feed.groups.inject({}) do |hash, group|
      hash[group.gid] = group
      hash
    end
    
    raw_feed.items.map do |item|
      if item.source_id > 0
        item.source = users[item.source_id]
      else
        item.source = groups[-item.source_id]
      end
      
      item
    end
  end
end
