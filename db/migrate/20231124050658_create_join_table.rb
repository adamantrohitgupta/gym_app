class CreateJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :memberships, :users do |t|
      # t.index [:membership_id, :user_id]
      # t.index [:user_id, :membership_id]
    end
  end
end
