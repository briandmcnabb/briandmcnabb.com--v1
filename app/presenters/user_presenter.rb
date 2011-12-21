class UserPresenter < BasePresenter
  
  def first_name
    handle_none user.first_name do
      user.first_name
    end
  end
  
  def last_name
    handle_none user.last_name do
      user.last_name
    end
  end
  
  def headline
    handle_none user.headline do
      render_markdown(user.headline)
    end
  end
  
  def bio
    handle_none user.bio do
      render_markdown(user.bio)
    end
  end
  
  def avatar
    handle_none(user.avatar, placeholder_image('200x280')) do
      image_tag user.avatar.asset_path_url
    end
  end
  
  def resume
    handle_none(user.avatar, '') do
      link_to 'resume', user.resume.asset_path_url, class: 'resume'
    end
  end
  
  def tweets
    username = user.connections.where(provider: 'twitter').first.username.split('/').last
    if username
      twitter_feed(username)
    end
  end
  
end