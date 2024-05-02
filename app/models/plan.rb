class Plan < ApplicationRecord
    belongs_to :user
    belongs_to :membership

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "gym_class_id", "gym_id", "id", "membership_id", "session_id", "updated_at", "user_id"]
  end
  # def self.ransackable_associations(auth_object = nil)
  #   ["membership", "user"]
  # end
end
