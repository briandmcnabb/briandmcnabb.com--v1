class ClientPresenter < BasePresenter
  
  def logo
    handle_none(client.client_logo, placeholder_image('269x269')) do
      image_tag client.client_logo.asset_path_url
    end
  end
  
  def organization
    handle_none client.organization do
      content_tag :h1, client.organization
    end
  end
  
  def website
    handle_none client.url do
      content_tag :p, ('website: ' + link_to(client.url, client.url)).html_safe
    end
  end
  
  def description
    handle_none client.description do
      content_tag :p, client.description
    end
  end

end