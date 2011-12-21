class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.references :user
      t.string :provider
      t.string :uid
      t.string :username
      t.string :url

      t.timestamps
    end
    add_index :connections, :user_id
  end
end
