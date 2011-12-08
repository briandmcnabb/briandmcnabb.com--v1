class Admin::ServicesController < Admin::ResourceController
  def sort
    params[:faq].each_with_index do |id, index|
      Service.update_all({position: index+1}, {id: id})
    end
    render nothing: true
  end
end