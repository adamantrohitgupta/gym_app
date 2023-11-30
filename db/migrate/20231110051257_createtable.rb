class Createtable < ActiveRecord::Migration[7.0]
  def change
    create_table :memberships do |t|
      t.string :name
      t.string :discription
      t.date :start_date
      t.date :end_date
      

      t.timestamps
    end
  end
end
