class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.integer :position
      t.string :organization
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :url
      t.text :description

      t.timestamps
    end
  end
end
