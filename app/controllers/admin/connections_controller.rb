class Admin::ConnectionsController < Admin::ResourceController
  actions :index, :create, :destroy
  
  def index
    @connections = current_user.connections.all
    @providers = %w(twitter github linkedin) - @connections.collect { |connection| connection.provider  }
    index!
  end
  
  
  protected
  
  def begin_of_association_chain
    current_user
  end
  
end
