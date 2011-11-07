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

  
  
end