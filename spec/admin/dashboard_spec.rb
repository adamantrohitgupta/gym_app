 require 'rails_helper'

RSpec.describe Admin::DashboardController, type: :controller do
  render_views
  
  it 'redirects to login' do
    get :index
    expect(response).to redirect_to(new_admin_user_session_path)
  end

  context 'when logged in as admin' do
    let(:admin) { AdminUser.create(email: 'admin@example.com', password: 'password') }
    before { sign_in(admin) }

    it 'renders page' do
      get :index
      expect(response).to be_successful
    end
  end
end