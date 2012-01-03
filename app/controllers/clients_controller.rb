class ClientsController < ResourceController
  protected
    def collection
      @clients ||= end_of_association_chain.includes(:client_logo, :projects, :images, :services)
    end
end