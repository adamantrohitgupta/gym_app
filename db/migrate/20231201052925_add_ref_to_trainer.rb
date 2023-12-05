class AddRefToTrainer < ActiveRecord::Migration[7.0]
  def change
    add_reference :gym_classes, :trainer
  end
end
