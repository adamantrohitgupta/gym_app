require 'rails_helper'
RSpec.describe Plan, type: :model do
  describe 'associations' do
    it { should belong_to :user }
    it { should belong_to :membership }
  end

  describe "ransackable_attributes" do
   it "returns expected attributes" do
     attributes = Plan.ransackable_attributes
 
     expect(attributes).to contain_exactly("created_at", "id", "membership_id", "updated_at", "user_id")
   end
  end
end