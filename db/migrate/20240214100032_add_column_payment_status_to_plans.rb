class AddColumnPaymentStatusToPlans < ActiveRecord::Migration[7.0]
  def change
    add_column :plans, :session_id, :string
  end
end
