class Admin::ProjectsController < Admin::ResourceController
  before_filter :assign_user, :only => [:create]
  belongs_to :client

  def sort
    params[:project].each_with_index do |id, index|
      Project.update_all({position: index+1}, {id: id})
    end
    render nothing: true
  end

   protected
   def assign_user 
     build_resource.user = current_user 
   end
end