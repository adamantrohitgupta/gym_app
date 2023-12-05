require 'rails_helper'
RSpec.describe Trainer, type: :model do
  describe 'associations' do
    it { should have_many :gym_classes }
  end

  describe "ransackable_attributes" do
    it " expected attributes" do
      attributes = Trainer.ransackable_attributes
  
      expect(attributes).to contain_exactly("created_at", "email", "experience", "id", "name", "phone", "specialist", "updated_at")
     end
  end
 
   describe "ransackable_associations" do
    it " expect associations" do
      associations = Trainer.ransackable_associations
      expect(associations).to contain_exactly("gym_classes", "image_attachment", "image_blob")
    end
  end

end