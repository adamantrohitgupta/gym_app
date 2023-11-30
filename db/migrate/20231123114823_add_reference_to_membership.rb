class AddReferenceToMembership < ActiveRecord::Migration[7.0]
  def up
  drop_table :memberships_users
  end
  def down
  end
end
