class Message < ApplicationRecord
  before_create :confirm_participant
  after_create_commit { broadcast_append_to self.room }

  belongs_to :user
  belongs_to :room

  def self.ransackable_attributes(auth_object = nil)
    ["content", "created_at", "id", "room_id", "updated_at", "user_id"]
  end
  
  private

  def confirm_participant
    if self.room.is_private
      is_participant = Participant.where(user_id: self.user.id, room_id: self.room.id).first
      throw :abort unless is_participant
    end
  end
end
 
