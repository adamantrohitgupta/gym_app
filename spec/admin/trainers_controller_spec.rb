require 'rails_helper'

RSpec.describe Admin::TrainersController, type: :controller do
  render_views
  before(:each) do
    admin = AdminUser.create(email: 'admin@example.com', password: 'password')
    admin.save
    sign_in(admin)
  end
   

  describe 'admin::Trainerscontroller post #create' do
    it 'create trainers' do
      post :create,params: { name: "rohit", email: "rohit@123",specialist:"yoga",experience:2,phone:"456789089"}
      expect(response).to have_http_status(200)
    end
  end
end