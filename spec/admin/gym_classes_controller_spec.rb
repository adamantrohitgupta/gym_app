require 'rails_helper'

RSpec.describe Admin::GymClassesController, type: :controller do
  render_views
  before(:each) do
    admin = AdminUser.create(email: 'admin@example.com', password: 'password')
    sign_in(admin)
  end
   
  describe 'admin::GymClassescontroller post #create' do
    it 'create gym class data' do
      post :create,params: { name: " ram", description: "ram ki gym",start_time:"06:00",end_time:"07:00",capacity:3,gym_id:2,trainer_id:1}
      expect(response).to have_http_status(200)
    end
  end
end