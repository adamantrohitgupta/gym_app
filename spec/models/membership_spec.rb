require 'rails_helper'
RSpec.describe Membership, type: :model do
 describe 'validations' do
   it { should validate_presence_of :name }
   it { should validate_presence_of :discription }
   it { should validate_presence_of :days}
   it { should validate_presence_of :price}
 end
  describe 'associations' do
    it { should belong_to :gym }
    it { should belong_to :gym_class }
    it { should have_many :plans }
    it { should have_many :users }
  end
  describe "ransackable_attributes" do
    it " expected attributes" do
      attributes = Membership.ransackable_attributes
  
      expect(attributes).to contain_exactly("created_at", "days", "discription", "end_date", "gym_class_id", "gym_id", "id", "name", "price", "start_date", "updated_at")
     end
  end
 
   describe "ransackable_associations" do
    it " expect associations" do
      associations = Membership.ransackable_associations
      expect(associations).to contain_exactly("gym", "gym_class", "plans", "users")
    end
  end
end
 