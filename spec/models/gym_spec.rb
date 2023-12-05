require 'rails_helper'
RSpec.describe Gym, type: :model do
 describe 'validations' do
   it { should validate_presence_of :name }
   it { should validate_presence_of :discription }
 end
  describe 'associations' do
    it { should have_many :gym_classes }
    it { should have_many :memberships }
    it { should have_many :users }
    it { should have_many :trainers }
  end
  describe "ransackable_attributes" do
    it " expected attributes" do
      attributes = Gym.ransackable_attributes
  
      expect(attributes).to contain_exactly("created_at", "discription", "id", "name", "updated_at")
     end
  end
 
  describe "ransackable_associations" do
    it " expect associations" do
      associations = Gym.ransackable_associations
      expect(associations).to contain_exactly("gym_classes", "images_attachment", "images_blob", "memberships")
    end
  end
end
