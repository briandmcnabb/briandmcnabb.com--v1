class Admin::ConnectionsController < Admin::ResourceController
  actions :index, :create, :destroy
  
  def create
    auth = request.env['omniauth.auth']
    current_user.connections.find_or_create_by_provider_and_uid(auth['provider'], auth['uid'], username: auth['info']['nickname'] )
    create! { redirect_to admin_connections_url }
  end
  
  
  protected
  
  def begin_of_association_chain
    current_user
  end
end
