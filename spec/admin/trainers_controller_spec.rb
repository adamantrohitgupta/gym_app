require 'rails_helper'

RSpec.describe Admin::TrainersController, type: :controller do
  render_views

  before(:each) do
    admin = AdminUser.create(email: 'admin@example.com', password: 'password')
    admin.save
    sign_in(admin)
  end

  describe 'admin::TrainersController post #create' do
    it 'creates trainers' do
      post :create, params: {
        trainer: {
          name: 'rohit',
          email: 'rohit@123',
          specialist: 'yoga',
          experience: 2,
          phone: '456789089'
        }
      }
      # expect(response).to have_http_status(200)
      #  expect(response).to redirect_to(some_path)
      #  follow_redirect!
      expect(response).to have_http_status(302)
      #  expect(response).to redirect_to(admin_trainer_path(Trainer.last))

    end
  end
end
