atom_feed do |feed|
  feed.title("briandmcnabb")
  blog = collection.first
  if blog
    present blog do |present_blog|
      feed.updated(present_blog.updated_at)
    end
  else
    feed.updated()
  end

  collection.each do |post|
    present post do |present_post|	
      feed.entry(post, published: present_post.publish_datetime, updated: present_post.updated_at) do |entry|
        entry.title(present_post.combined_title)
        entry.content(present_post.body, :type => 'html')
        entry.author do |author|
          author.name(post.user.full_name)
          author.email(post.user.email)
          author.uri(root_url)
        end
      end
    end
  end
end