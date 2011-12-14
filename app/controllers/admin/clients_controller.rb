class Admin::ClientsController < Admin::ResourceController
  def sort
    params[:client].each_with_index do |id, index|
      Client.update_all({position: index+1}, {id: id})
    end
    render nothing: true
  end
end