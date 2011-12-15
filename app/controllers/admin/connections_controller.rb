class Admin::ConnectionsController < Admin::ResourceController
  actions :index, :create, :destroy
  
  def create
    auth = request.env['omniauth.auth']
    @connection = current_user.connections.find_or_create_by_provider_and_uid(auth['provider'], auth['uid'], username: auth['info']['nickname'] )
    create! { render nil }{ redirect_to connections_url }
  end
  
  
  protected
  
  def begin_of_association_chain
    current_user
  end
end
