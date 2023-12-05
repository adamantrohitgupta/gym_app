require 'rails_helper'

RSpec.describe MembershipsController, type: :controller do 
  let(:gym) {Gym.create(name:"fitness",discription:"ok")}
  let(:trainer) { Trainer.create(name:"ram")}
  let(:gymclass)  {GymClass.create(name:"yoga",description:"ok",start_time:"06:00",end_time:"07:00",gym_id: gym.id,trainer_id:trainer.id,capacity:30)}
  
   
  describe "Membershipscontroller #create" do
   context "with valid attributes" do        
     it "create new membership" do
        params = {
          membership: {
           name:"ram kumar",
           discription:"ram gym",
           days:"30",
           price:100,
           gym_id: gym.id,
           gym_class_id: gymclass.id
          }
        }
        post :create, params: params
        expect(response).to have_http_status(201)
      end
    end
      
    # context "with not valid attributes " do
    #  it "it not create new membrship " do
    #    post :create, params: {membership: {} }
    #    expect(Membership.count).to eq(0)
    #   end
    # end
    context "with invalid attributes" do
      it " not create a new membership" do
        params = {
           membership: {
             name:"ram kumar"
           }
          }
         post :create, params: params
        #  expect(Membership.count).to eq(0)
        expect(response).to have_http_status(200)

       end
     end
  end
  
  describe "Membershipscontroller GET #show" do
   context "user see  the data" do
     it "render the show template" do
        membership = Membership.create(
          name:"ram kumar",
          discription:"ram gym",
          price:100,
          days:"30",
          gym_id: gym.id,
          gym_class_id: gymclass.id 
        )
        
        get :show, params:{ id: membership.id }
        expect(response).to be_successful
      end
    end
  end
  
  describe "Membershipscontroller delete #show" do
  context "admin delete  the data" do
    it "render the show template" do
       membership = Membership.create(
         name:"ram kumar",
         discription:"ram gym",
         price:100,
         days:"30",
         gym_id: gym.id,
         gym_class_id: gymclass.id 
       )
       
       delete :destroy, params:{ id: membership.id }
       expect(response).to be_successful
     end
   end
 end







end
