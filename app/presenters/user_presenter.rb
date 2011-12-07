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
  
  def description
    handle_none user.description do
      user.description
    end
  end
  
  def avatar
    handle_none(user.avatar, placeholder_image('200x600')) do
      image_tag user.avatar.asset_path_url
    end
  end
  
end