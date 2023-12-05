class Trainer < ApplicationRecord
 has_many :gym_classes 
 has_one_attached :image

 
 def self.ransackable_attributes(auth_object = nil)
  ["created_at", "email", "experience", "id", "name", "phone", "specialist", "updated_at"]
 end
 def self.ransackable_associations(auth_object = nil)
   ["gym_classes", "image_attachment", "image_blob"]
 end

end
