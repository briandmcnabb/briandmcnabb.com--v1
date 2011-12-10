class PostsController < ResourceController
  respond_to :atom
  
  protected
  def collection
    @posts ||= end_of_association_chain.published
  end
end