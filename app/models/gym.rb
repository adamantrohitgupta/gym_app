class Gym < ApplicationRecord
  has_many :gym_classes,dependent: :destroy
  has_many :memberships,dependent: :destroy
  has_many :users, through: :memberships
  has_one_attached :images

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "discription", "id", "name", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["gym_classes", "images_attachment", "images_blob", "memberships"]
  end
end
