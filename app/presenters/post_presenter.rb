class PostPresenter < BasePresenter

  def title
    handle_none post.title do
      current_page?(posts_path) ? link_to(post.title, post_path(post)) : post.title
    end
  end
  
  def sub_title
    handle_none post.sub_title, nil do
      post.sub_title
    end
  end

  def body
    handle_none post.body do
      current_page?(posts_path)	? snippet(post.body, 80) : post.body
    end
  end

  def publish_date
    handle_none post.publish_date do
      time_tag(post.publish_date, post.publish_date.strftime('%b.%d.%Y'), pubdate: true)
    end  
  end

end