class AddChangesToRoom < ActiveRecord::Migration[7.0]
  def change
    change_column :rooms, :is_private, :boolean, default: false
   #Ex:- change_column("admin_users", "email", :string, :limit =>25) boolean :is_private, :default => false
  end
end
