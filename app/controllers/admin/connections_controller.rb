class Admin::ConnectionsController < Admin::ResourceController
  actions :index, :destroy
  
  def create
    auth = request.env['omniauth.auth']
    current_user.connections.find_or_create_by_provider_and_uid(auth['provider'], auth['uid'], username: auth['info']['nickname'] )
    render nil
  end
  
  
  protected
  
  def begin_of_association_chain
    current_user
  end
end
