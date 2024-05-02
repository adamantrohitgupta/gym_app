class User < ApplicationRecord
  scope :all_except, ->(user) { where.not(id: user) }
  after_create_commit { broadcast_append_to "users" }
  # has_secure_password
  # has_and_belongs_to_many :memberships
  has_many :plans
  has_many :memberships, through: :plans
  has_many :messages,dependent: :destroy

  validates :name, presence: true
  validates :address , presence:true
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  
   def self.ransackable_attributes(auth_object = nil)
    ["address", "created_at", "date_of_birth", "email", "encrypted_password", "id", "name", "phone_number", "remember_created_at", "reset_password_sent_at", "reset_password_token", "stripe_id", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["memberships", "messages", "plans"]
  end
  
   

end
