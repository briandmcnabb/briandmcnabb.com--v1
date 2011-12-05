class ServicePresenter < BasePresenter
  
  def symbol
    handle_none(service.service_symbol, placeholder_image('200x200')) do
      image_tag service.service_symbol.asset_path_url
    end
  end
  
  def name
    handle_none service.name do
      content_tag(:h1, service.name)
    end
  end
  
  def description
    handle_none service.description do
      content_tag(:p, service.description)
    end
  end
    
end