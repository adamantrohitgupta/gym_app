class AddReferencesToGymClass < ActiveRecord::Migration[7.0]
  def change
    add_reference :memberships, :gym_class
  end
end
