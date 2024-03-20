class AddColumnGymClassIdToPlans < ActiveRecord::Migration[7.0]
  def change
    add_column :plans, :gym_class_id, :string
  end
end
