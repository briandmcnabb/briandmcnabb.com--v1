class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :name
      t.references :user
      t.references :service

      t.timestamps
    end
    add_index :skills, :user_id
    add_index :skills, :service_id
  end
end
