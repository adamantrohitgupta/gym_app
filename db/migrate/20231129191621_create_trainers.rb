class CreateTrainers < ActiveRecord::Migration[7.0]
  def change
    create_table :trainers do |t|
      t.string :name
      t.integer :experience
      t.string :specialist
      t.string :email
      t.integer :phone

      t.timestamps
    end
  end
end
