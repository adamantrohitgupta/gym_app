require 'rails_helper'

RSpec.describe Admin::MembershipsController, type: :controller do
  render_views
  before(:each) do
    admin = AdminUser.create(email: 'admin@example.com', password: 'password')
    admin.save
    sign_in(admin)
  end
   

  describe 'admin::Membershipscontroller post #create' do
    it 'create memberships' do
      post :create,params: { name: "prime", discription: "one month",days:"30",price:100}
      expect(response).to have_http_status(200)
    end
  end
end