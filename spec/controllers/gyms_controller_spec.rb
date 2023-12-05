require 'rails_helper'

RSpec.describe GymsController, type: :controller do 
  let(:gym) { Gym.create(name: "power", discription: " this gym is best")}
 
 describe "GET #index" do
   it "returns a successful response" do
     get :index
     expect(response).to be_successful
   end
  end
 
  describe "GET #new" do
   it "returns a successful response" do
     get :new
     expect(response).to be_successful
   end

   it "renders the :new template" do
     get :new
     expect(response).to render_template(:new)
   end
  end
  
  describe "POST #create" do
   context "with valid attributes" do
     it "create new gym" do
       params = {
         gym: {
           name:"ram kumar",
           discription:"ram gym",
         }
        }
        post :create, params: params
        expect(response).to have_http_status("302")
     end
    end
  

   context "with invalid attributes" do
     it " not create a new gym" do
       params = {
          gym: {
            name:"ram kumar"
          }
         }
        post :create, params: params
        expect(response).to have_http_status("200")
      end
    end
  end

  # context "User see the data" do
  #   it "renders the show template" do
  #     get :show, params: {id: gym.id}
  #     expect(response).to have_http_status("200")    
  #   end
  # end
  # describe "User see the data" do
  #   let(:gym) { Gym.create(name: "power", discription: " this gym is best")} # Assuming you have a Gym factory or you can create a gym object
  
  context "User see the data" do
    it "renders the show template" do
      get :show, params: { id: gym.id }
      expect(response).to have_http_status(302)
    end
  end
  
  describe "Gymscontroller patch #update" do
   context "User can update the data" do
     it "renders the update template" do
       patch :update, params: {id: gym.id, gym: { name: "New name", discription: "test@gmail.com" } }
       expect(response).to have_http_status("302") 
     end
   end

   context "User can not update the data" do
      it "renders the update template" do
        patch :update, params: {id: gym.id, gym: { name: " ", discription: "test@gmail.com" } }
        expect(response).to have_http_status(:unprocessable_entity) 
      end
    end
  end
   
  context "User can delete the data" do
    it "renders the show  template" do
      delete :destroy, params: {id: gym.id }
      expect(response).to be_successful
    end
  end
end 
 