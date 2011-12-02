class ServicePresenter < BasePresenter
  
  def logo
    handle_none(service.service_symbol, placeholder_image('200x200')) do
      image_tag service.service_symbol.asset_path_url, alt: "#{service.name.downcase}"
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
  
  
  
  private
  
  def placeholder_image(size)
    image_tag("http://placehold.it/#{size}", alt: "#{service.name.downcase}")
  end
  
end