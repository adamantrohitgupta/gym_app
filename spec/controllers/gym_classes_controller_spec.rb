require 'rails_helper'

RSpec.describe GymClassesController, type: :controller do
  let(:gym) {Gym.create(name:"ramtness",discription:"gym is grt")}
  let(:trainer) { Trainer.create(name:"lakhan")}
 let(:gym_class)  { GymClass.create(
        name:"yoga ",
        description:"class is best",
        start_time: "06:00",
        end_time:"07:00",
        capacity:5,
        gym_id: gym.id,
        trainer_id: trainer.id 
      )}
  let(:user) { User.create(name: "John Doe", email: "johndoe@example.com",address:"gohan",password:"123456")}
  
  describe "POST #create" do
   context "with valid attributes" do
      it "create a new gymclass" do
        params = {
         gym_class: {
           name:"yoga ",
           description:"class is best",
           start_time: "06:00",
           end_time:"07:00",
           capacity:5,
           gym_id: gym.id,
           trainer_id: trainer.id 
          }
        }
        post :create, params: params
        expect(response).to have_http_status(302)
      end
    end
    context "with not valid attributes" do
      it "not  cretae a new gymclass" do
        params = {
         gym_class: {
           name:" ",
           description:"class is best",
           start_time: "06:00",
           end_time:"07:00",
           capacity:5,
           gym_id: gym.id,
           trainer_id: trainer.id 
          }
        }
        post :create, params: params
        expect(response).to have_http_status(200)
      end
    end
  end
   
  describe "GET #index" do
   it "return a successful response" do
     get :index
     expect(response).to be_successful
    end
  end
 
  describe "Gymclassescontroller Get #show" do
    it "renders the show template" do
      sign_in(user) 
      get :show, params: { id: gym_class.id }
      expect(response).to be_successful
    end
  end
    
  describe "Gymclassescontroller delete #destroy" do
    it "renders the gymclass index  template" do
      delete :destroy ,params: { id: gym_class.id }
      expect(response).to have_http_status(303)
    end
  end
 
  describe "GymclassesController patch #update" do
    context "update the data  with valid attribute" do 
     it "render the  update template" do
       patch :update ,params: {id: gym_class.id, gym_class: { name:"cardio ",
                                                             description:"class is best",
                                                             start_time: "06:00",
                                                             end_time:"07:00",
                                                             capacity:5,
                                                             gym_id: gym.id,
                                                             trainer_id: trainer.id
                                                             } }
                                                             
                                                             
        expect(response).to have_http_status(302)
      end
    end
  end

  context "update the data not valid attribute" do 
    it "render the  update template" do
      patch :update ,params: {id: gym_class.id, gym_class: { name:" ",
                                                            description:"class is best",
                                                            start_time: "06:00",
                                                            end_time:"07:00",
                                                            capacity:5,
                                                            gym_id: gym.id,
                                                            trainer_id: trainer.id
                                                            } }
                                                            
                                                            
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end

 