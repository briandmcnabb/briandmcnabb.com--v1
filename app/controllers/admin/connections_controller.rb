class Admin::ConnectionsController < Admin::ResourceController
  actions :index, :destroy
  
  def index
    @connections = current_user.connections.all
    @providers = %w(twitter github dribbble linkedin) - @connections.collect { |connection| connection.provider  }
    index!
  end
  
  def create
    current_user.connections.where(provider: provider, uid: uid) || current_user.connections.create(provider: provider, uid: uid, username: profile_url)
    redirect_to admin_connections_url
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
  
  def uid
    auth_hash['uid']
  end
  
  def provider
    auth_hash['provider']
  end

  def profile_url
    auth_hash['info']['urls'].select { |k,v| v if v && v.include?(auth_hash['provider']) }.values[0]
  end
end
