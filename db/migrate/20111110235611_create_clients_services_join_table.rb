class CreateClientsServicesJoinTable < ActiveRecord::Migration
  def change
    create_table :clients_services, :id => false do |t|
      t.integer :client_id
      t.integer :service_id
    end
  end
end
