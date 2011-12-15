class Admin::ConnectionsController < Admin::ResourceController
  actions :index, :create, :destroy
  
  def create
    auth = request.env['omniauth.auth']
    @connection = current_user.connections.create(provider: auth['provider'], uid: auth['uid'], username: auth['info']['nickname'] )
    create!
  end
  
  
  protected
  
  def begin_of_association_chain
    current_user
  end
end
