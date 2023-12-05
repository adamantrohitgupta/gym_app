class Membership < ApplicationRecord
  belongs_to :gym
  belongs_to :gym_class
  has_many :plans
  has_many :users,through: :plans


  validates :name, presence: true 
  validates :discription, presence: true
  validates :days,    presence: true
  validates :price,  presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "days", "discription", "end_date", "gym_class_id", "gym_id", "id", "name", "price", "start_date", "updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["gym", "gym_class", "plans", "users"]
  end

end
