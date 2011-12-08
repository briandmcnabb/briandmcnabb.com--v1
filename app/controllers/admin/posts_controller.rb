class Admin::PostsController < Admin::ResourceController

  def sort
    params[:post].each_with_index do |id, index|
      Post.update_all({position: index+1}, {id: id})
    end
    render nothing: true
  end

  protected
    def begin_of_association_chain 
      current_user 
    end
end