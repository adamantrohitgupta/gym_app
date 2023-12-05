require 'rails_helper'

RSpec.describe Admin::GymsController, type: :controller do
  render_views
  before(:each) do
    admin = AdminUser.create(email: 'admin@example.com', password: 'password')
    admin.save
    sign_in(admin)
    # gym = Gym.create(name:"power",discription:"this gym is best")
  end
  # describe 'admin::Gymscontroller get #index' do
  #   it 'get all data' do
  #     get :index#,params: { id: gym.id }
  #     expect(response).to have_http_status(200)
  #   end
  # end

  describe 'admin::Gymscontroller post #create' do
    it 'create gym data' do
      post :create,params: { name: " ram", discription: "ram ki gym"}
      expect(response).to have_http_status(200)
    end
  end
end