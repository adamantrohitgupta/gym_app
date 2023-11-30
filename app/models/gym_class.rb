class GymClass < ApplicationRecord
  belongs_to :gym  
  has_one_attached :images
  has_many :memberships  
 
 
  def self.ransackable_attributes(auth_object = nil)
    ["capacity", "created_at", "description", "end_time", "gym_id", "id", "name", "start_time", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["gym", "images_attachment", "images_blob", "memberships", "users"]
  end
end
