class Admin::ConnectionsController < Admin::ResourceController
  actions :index, :destroy
  
  def index
    @connections = current_user.connections.all
    @providers = %w(twitter github dribbble linkedin) - @connections.collect { |connection| connection.provider  }
    index!
  end
  
  def create
    auth = request.env['omniauth.auth']
    render :text => auth.to_yaml
    #auth = request.env['omniauth.auth']
    #provider = auth['provider']
    #uid = auth['uid']
    #username = auth['info']['nickname'] || auth['info']['name']
    #url = auth['info']['urls']
    #current_user.connections.find_or_create_by_provider_and_uid(provider, uid, username: username)
    #redirect_to admin_connections_url
  end
  
  
  protected
  
  def begin_of_association_chain
    current_user
  end
end
