class AddColumnToGymClass < ActiveRecord::Migration[7.0]
  def change
    add_column :gym_classes, :capacity, :integer
  end
end
