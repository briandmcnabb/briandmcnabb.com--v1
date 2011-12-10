module DisqusHelper
  
  def disqus(resource)
    disqus_thread + js_snippet(resource) + noscript
  end
  
  def enable_comment_count
    content_for :javascript do
      shortname   = 'briandmcnabb' # ENV['DISQUS_SHORTNAME']
      environment = Rails.env == 'development' ? 1 : 0
      js = javascript_tag do
        "var disqus_shortname  = '#{shortname}';
		  	 var disqus_developer  = #{environment};
         
		  	 (function () {
           var s = document.createElement('script'); s.async = true;
           s.type = 'text/javascript';
           s.src = 'http://' + disqus_shortname + '.disqus.com/count.js';
           (document.getElementsByTagName('HEAD')[0] || document.getElementsByTagName('BODY')[0]).appendChild(s);
         }());"
      end
    end
  end
  
  
  
  private
  
  def disqus_thread
    content_tag(:div, '', id: 'disqus_thread')
  end
  
  def js_snippet(resource)
    shortname   = 'briandmcnabb' # ENV['DISQUS_SHORTNAME']
    identifier  = Digest::MD5.hexdigest(dom_id(resource, nil))
    environment = Rails.env == 'development' ? 1 : 0
    js = javascript_tag do
      "var disqus_shortname  = '#{shortname}';
			 var disqus_identifier = '#{identifier}';
			 var disqus_developer  = #{environment};
       
			 (function() {
			 	var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
			 	dsq.src = 'http://' + disqus_shortname + '.disqus.com/embed.js';
			 	(document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
			 })();"
    end
  end
  
  def noscript
    content_tag :noscript do
      "Please enable JavaScript to view the #{link_to 'comments powered by Disqus', 'http://disqus.com/?ref_noscript'}"
    end
  end
  
end