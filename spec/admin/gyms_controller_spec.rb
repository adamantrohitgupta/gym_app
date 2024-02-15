require 'rails_helper'

RSpec.describe Admin::GymsController, type: :controller do
  render_views
  before(:each) do
    admin = AdminUser.create(email: 'admin@example.com', password: 'password')
    sign_in(admin)
   end

  describe 'admin::Gymscontroller post #create' do
    it 'create gym data' do
      post :create,params: { name: "yoga", discription: "yoga is best"}
      expect(response).to have_http_status(200)
    end
  end
end