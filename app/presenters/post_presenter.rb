class PostPresenter < BasePresenter
  
  def body
    render_markdown post.body
  end
  
  def abbr_body(length=150)
    snippet(post.body, length)
  end
  
  def publish_date
    handle_none post.publish_date do
      time_tag(post.publish_date, pubdate: true)
    end
  end
  
  def big_publish_date
    handle_none post.publish_date do
      time_tag(post.publish_date, wrapped_date_elements('%b', '%d', '%Y'), pubdate: true)
    end
  end
  
  
  private
  
  def wrapped_date_elements(*args)
    array = args.map { |arg| content_tag(:div, post.publish_date.strftime(arg), :class => arg.gsub('%', 'strftime-')) }
    array.join.html_safe
  end

end