class AddColumnToPlans < ActiveRecord::Migration[7.0]
  def change
    add_column :plans, :gym_id, :string
  end
end
