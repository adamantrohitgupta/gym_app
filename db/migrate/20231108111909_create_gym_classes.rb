class CreateGymClasses < ActiveRecord::Migration[7.0]
  def change
    create_table :gym_classes do |t|
      t.string :name
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
