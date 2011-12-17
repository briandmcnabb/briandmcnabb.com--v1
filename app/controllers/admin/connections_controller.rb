class Admin::ConnectionsController < Admin::ResourceController
  actions :index, :destroy
  
  def index
    @connections = current_user.connections.all
    @providers = %w(twitter github dribbble linkedin) - @connections.collect { |connection| connection.provider  }
    index!
  end
  
  def create
    render text: auth_hash.to_yaml
    #current_user.connections.find_or_create_by_provider_and_uid(auth_hash['provider'], auth_hash['uid'], username: profile_url(auth_hash['info']['urls']))
    #redirect_to admin_connections_url
  end
  
  def failure
    redirect_to root_url, :alert => "Authentication error: #{params[:message].humanize}"
  end
  
  protected
  
  def begin_of_association_chain
    current_user
  end
  
  def auth_hash
    request.env['omniauth.auth']
  end

  def profile_url(urls)
    urls.select { |k,v| v if v && v.include?(auth_hash['provider']) }.values[0]
  end
end
