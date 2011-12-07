class PostsController < ResourceController
  protected
  def collection
    @posts ||= end_of_association_chain.published
  end
end