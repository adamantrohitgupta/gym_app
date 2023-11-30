class AddColoumnToMembership < ActiveRecord::Migration[7.0]
  def change
    add_column :memberships, :price, :integer
  end
end
