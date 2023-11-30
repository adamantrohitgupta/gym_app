class CreateTrainees < ActiveRecord::Migration[7.0]
  def change
    create_table :trainees do |t|
      t.string :name
      t.date :date_of_birth
      t.string :email
      t.string :phone_number
      t.string :address

      t.timestamps
    end
  end
end
