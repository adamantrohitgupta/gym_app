class ChangeColumnToTrainers < ActiveRecord::Migration[7.0]
  def change
    change_column :trainers, :phone, :bigint 
    change_column :users, :phone_number, :bigint 
  end
end
