class CreateInquiries < ActiveRecord::Migration
  def change
    create_table :inquiries do |t|
      t.string :first_name
      t.string :last_name
      t.string :timetable
      t.string :description

      t.timestamps
    end
  end
end
