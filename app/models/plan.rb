class Plan < ApplicationRecord
    belongs_to :user
    belongs_to :membership

    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "id", "membership_id", "updated_at", "user_id"]
      end
    
end
