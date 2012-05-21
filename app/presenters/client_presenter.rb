class ClientPresenter < BasePresenter

  def logo
    handle_none(client.client_logo, placeholder_image('269x269')) do
      content_tag :div, class: 'logo' do
        image_tag client.client_logo.asset_path_url
      end
    end
  end

  def organization
    handle_none client.organization do
      content_tag :h1, client.organization
    end
  end

  def website
    handle_none client.url do
      link_to client.url, id: 'website' do
        text = content_tag(:span, 'visit the site'.html_safe, id: 'text')
        arrows = content_tag(:span, '&#8250;&#8250;'.html_safe, id: 'arrows')
        text + arrows
      end
    end
  end

  def description
    handle_none client.description do
      content_tag :p, client.description
    end
  end

end