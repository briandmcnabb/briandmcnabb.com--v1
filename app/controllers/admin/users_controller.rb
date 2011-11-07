class Admin::UsersController < Admin::ResourceController
  defaults singleton: true
  
  
  protected
  
  def resource
    User.first
  end
  
  def build_resource(attributes = {})
    User.new(attributes)
  end
  
end