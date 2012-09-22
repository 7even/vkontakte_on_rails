class MainController < ApplicationController
  def index
    vk = VkontakteApi::Client.new(session[:token])
    
    # текущий юзер
    @user = vk.users.get(uid: session[:vk_id], fields: [:screen_name, :photo]).first
    
    # друзья
    @friends = vk.friends.get(fields: [:screen_name, :sex, :photo, :last_seen])
    @friends_online = @friends.select { |friend| friend.online == 1 }
    
    # группы
    @groups = vk.groups.get(extended: 1)
    # первый элемент массива - кол-во групп; его нужно выкинуть
    @groups.shift
    
    # лента новостей
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
