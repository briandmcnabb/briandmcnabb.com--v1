class UserPresenter < BasePresenter
  
  def first_name
    handle_none(user.first_name, '') do
      user.first_name
    end
  end
  
  def last_name
    handle_none(user.last_name, '') do
      user.last_name
    end
  end
  
  def full_name
    "#{first_name} #{last_name}"
  end
  
  def email
    handle_none user.email do
      user.email
    end
  end
  
  def phone_number
    handle_none(user.phone_number, '') do
      num = user.phone_number
      "#{num[0..2]}.#{num[3..5]}.#{num[6..9]}"
    end
  end
  
  def headline
    handle_none user.headline do
      content_tag(:div, render_markdown(user.headline), id: 'headline')
    end
  end
  
  def bio
    handle_none user.bio do
      content_tag(:div, render_markdown(user.bio), id: 'bio')
    end
  end
  
  def avatar
    content_tag :figure do
      handle_none(user.avatar, placeholder_image('200x280')) do
        image_tag user.avatar.asset_path_url
      end
    end
  end
  
  def resume
    handle_none(user.resume, '') do
      link_to 'resume', user.resume.asset_path_url, class: 'resume'
    end
  end
  
  def tweets
    content_tag :div, id: 'tweets' do
      username = user.connections.where(provider: 'twitter').first.try(:username)
      if username
        twitter_feed(username)
      end
    end
  end
  
end