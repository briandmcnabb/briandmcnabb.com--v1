class PostPresenter < BasePresenter
  
  def body
    render_markdown post.body
  end
  
  def abbr_body(length=150)
    snippet(post.body, length)
  end

  def publish_date
    time_tag(post.publish_date, post.publish_date.strftime('%b.%d.%Y'), pubdate: true)
  end

end