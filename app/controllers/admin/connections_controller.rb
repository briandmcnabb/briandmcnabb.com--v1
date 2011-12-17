class Admin::ConnectionsController < Admin::ResourceController
  actions :index, :destroy
  
  def index
    @connections = current_user.connections.all
    @providers = %w(twitter github dribbble linkedin) - @connections.collect { |connection| connection.provider  }
    index!
  end
  
  def create
    auth = request.env['omniauth.auth']
    current_user.connections.find_or_create_by_provider_and_uid(auth['provider'], auth['uid'], username: profile_url(auth['info']['urls'], auth['provider']))
    redirect_to admin_connections_url
  end
  
  def failure
    render :text => request.env["rack.auth"].to_yaml
  end
  
  protected
  
  def begin_of_association_chain
    current_user
  end

  def profile_url(urls, provider)
    urls.select { |k,v| v if v && v.include?(provider) }.values[0]
  end
end
