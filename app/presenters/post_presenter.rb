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

  def combined_title
    "#{title}: #{sub_title}"
  end

  def body
    handle_none post.body do
      current_page?(posts_path)	? snippet(render_markdown(post.body), 80) : render_markdown(post.body)
    end
  end

  # Change publish_date back to a datetime and the set getter and setter methods for published_at field
  def published_at
    handle_none post.published_at do
      time_tag(post.published_at, post.published_at.strftime('%b.%d.%Y'), pubdate: true)
    end
  end

  def publish_datetime
    convert_to_datetime(post.publish_date)
  end

  def updated_at
    [publish_datetime, post.updated_at].max
  end

  def comment_count
    link_to '', post_path(post, anchor: 'disqus_thread'),
      data: { :'data-disqus-identifier' => Digest::MD5.hexdigest(dom_id(post, nil)) },
      class: 'comment_count'
  end



  private

  def convert_to_datetime(date)
    Time.utc(date.year, date.month, date.day)
  end

end