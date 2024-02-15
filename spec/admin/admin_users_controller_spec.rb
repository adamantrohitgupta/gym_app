 
require 'rails_helper'

RSpec.describe 'AdminUser Admin Panel', type: :feature do
  let(:admin_user) { AdminUser.create(email: 'admin@example.com', password: 'password') }

  before(:each) do
    login_as(admin_user, scope: :admin_user) 
  end
  
  describe 'admin::AdminUserscontroller get #index' do
    it 'get all data' do
       visit admin_admin_users_path
      expect(page).to have_http_status(200)
    end
  end
end
