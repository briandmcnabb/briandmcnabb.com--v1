class Admin::ServicesController < Admin::ResourceController
  def sort
    params[:sevice].each_with_index do |id, index|
      Service.update_all({position: index+1}, {id: id})
    end
    render nothing: true
  end
  
  protected
  def collection
    @services ||= end_of_association_chain.order("position")
  end
end