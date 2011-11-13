class Admin::ProjectsController < Admin::ResourceController
  before_filter :assign_user, :only => [:create]
  belongs_to :client

   private 
   def assign_user 
     build_resource.user = current_user 
   end
end