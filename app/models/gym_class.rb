class GymClass < ApplicationRecord
  belongs_to :gym 
  belongs_to :trainer
  has_many :memberships  
  has_one_attached :images
  has_one_attached :video

  validates :name,        presence: true,length: { minimum: 4 }
  validates :start_time , presence: true
  validates :capacity,    presence: true
  validates :description, presence: true
  validates :end_time,    presence: true
 
   
  def self.ransackable_attributes(auth_object = nil)
    ["capacity", "created_at", "description", "end_time", "gym_id", "id", "name", "start_time", "trainer_id", "updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["gym", "images_attachment", "images_blob", "memberships", "trainer", "video_attachment", "video_blob"]
  end
end
