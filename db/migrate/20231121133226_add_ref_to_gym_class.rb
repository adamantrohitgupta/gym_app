class AddRefToGymClass < ActiveRecord::Migration[7.0]
  def change
    add_reference :gym_classes, :gym, foreign_key: true
  end
end
