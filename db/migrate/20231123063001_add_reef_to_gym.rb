class AddReefToGym < ActiveRecord::Migration[7.0]
  def change
    add_reference :memberships, :gym, foreign_key: true
  end
end
