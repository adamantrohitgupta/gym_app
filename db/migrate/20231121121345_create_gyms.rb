class CreateGyms < ActiveRecord::Migration[7.0]
  def change
    create_table :gyms do |t|
      t.string :name
      t.string :discription

      t.timestamps
    end
  end
end
