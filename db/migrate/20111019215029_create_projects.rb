class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.string :url
      t.references :user
      t.references :client

      t.timestamps
    end
    add_index :projects, :user_id
    add_index :projects, :client_id
  end
end
