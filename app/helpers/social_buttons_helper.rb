module SocialButtonsHelper
  def like_on_facebook(url)
		content_for :javascript do
		  content_tag(:div, '', id: 'fb-root')
		  javascript_tag do
		    "(function(d, s, id) {
		      var js, fjs = d.getElementsByTagName(s)[0];
          if (d.getElementById(id)) {return;}
          js = d.createElement(s); js.id = id;
          js.src = '//connect.facebook.net/en_US/all.js#xfbml=1';
          fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));"
		  end
		end
    content_tag(:div, '', class: 'fb-like', data: { href: url, send: false, layout: 'button_count', width: nil, :'show-faces' => 'false'} )
  end
  
  def google_plus_one(url)
    content_for :javascript do
		  javascript_tag do
		    "(function() {
          var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
          po.src = 'https://apis.google.com/js/plusone.js';
          var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
        })();"
		  end
		end
    content_tag(:div, '', class: 'g-plusone', data: { href: url, size: 'tall', annotation: 'none' } )
  end
    
  def share_on_twitter(url, via, text )
		content_for :javascript do
		  javascript_include_tag '//platform.twitter.com/widgets.js'
		end
    link_to 'Tweet', 'https://twitter.com/share', :class => "twitter-share-button", data: { url: url, via: via, text: text }
  end

  def twitter_feed(username)
		content_for :head do
      javascript_include_tag 'http://widgets.twimg.com/j/2/widget.js'
    end
    javascript_tag do
	    "new TWTR.Widget({
			  version: 2,
			  type: 'profile',
			  rpp: 5,
			  interval: 30000,
			  width: 960,
			  height: 300,
			  theme: {
			    shell: {
			      background: '#ecf0d7',
			      color: '#ecf0d7'
			    },
			    tweets: {
			      background: '#ecf0d7',
			      color: '#222222',
			      links: '#d14c3a'
			    }
			  },
			  features: {
			    scrollbar: true,
			    loop: false,
			    live: true,
			    behavior: 'all'
			  }
			}).render().setUser('#{username}').start();"
	  end
  end
  
end