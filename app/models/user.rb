class User < ApplicationRecord
  # has_and_belongs_to_many :memberships
  has_many :plans
  has_many :memberships, through: :plans


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  
   
  def self.ransackable_attributes(auth_object = nil)
    ["address", "created_at", "date_of_birth", "email", "encrypted_password", "id", "name", "phone_number", "remember_created_at", "reset_password_sent_at", "reset_password_token", "updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["memberships", "plans"]
  end
end
