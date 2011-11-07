class UsersController < ResourceController
  defaults singleton: true
  
  protected
    def resource
      User.first
    end
end