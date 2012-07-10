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
        "был онлайн #{last_seen_on(user.last_seen.time)}"
      else
        "была онлайн #{last_seen_on(user.last_seen.time)}"
      end
    end
  end
  
private
  def last_seen_on(timestamp)
    time = Time.at(timestamp)
    Russian.strftime(time, '%d %B в %H:%M')
  end
end
