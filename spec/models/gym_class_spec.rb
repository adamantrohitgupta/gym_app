require 'rails_helper'
RSpec.describe GymClass, type: :model do

 describe 'validations' do
   it { should validate_presence_of :name }
   it { should validate_presence_of :description }
   it { should validate_presence_of :capacity}
   it { should validate_presence_of :start_time}
   it { should validate_presence_of :end_time }
  end

  describe 'associations' do
   it { should belong_to :gym }
   it { should belong_to :trainer }
   it { should have_many :memberships }  
  end

 describe "ransackable_attributes" do
   it " expected attributes" do
     attributes = GymClass.ransackable_attributes
 
     expect(attributes).to contain_exactly("capacity", "created_at", "description", "end_time", "gym_id", "id", "name", "start_time", "trainer_id", "updated_at")
    end
 end

  describe "ransackable_associations" do
    it " expect associations" do
      associations = GymClass.ransackable_associations
      expect(associations).to contain_exactly("gym", "images_attachment", "images_blob", "memberships", "trainer")
    end
  end
end