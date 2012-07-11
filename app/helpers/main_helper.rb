# encoding: utf-8
module MainHelper
  def online?(user)
    user.online == 1
  end
  
  def male?(user)
    user.sex == 2
  end
  
  def online_status(user)
    if online?(user)
      content_tag(:strong, 'онлайн')
    elsif user.last_seen? && user.last_seen.time > 0
      if male?(user)
        "был онлайн #{formatted_time_for(user.last_seen.time)}"
      else
        "была онлайн #{formatted_time_for(user.last_seen.time)}"
      end
    end
  end
  
  def formatted_time_for(timestamp)
    time = Time.at(timestamp)
    Russian.strftime(time, '%d %B в %H:%M')
  end
  
  def avatar_for(source)
    if source.uid?
      source.photo_medium_rec
    else
      source.photo_medium
    end
  end
  
  def name_for(source)
    if source.uid?
      "#{source.first_name} #{source.last_name}"
    else
      source.name
    end
  end
end
