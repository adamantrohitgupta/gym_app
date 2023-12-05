 FactoryBot.define do
   factory :GymClass do
     name { "yoga"}
     discription { "yoga is best " }
     capacity { 5 }
     start_time {"06:00"}
     end_time {"07:00"}
     gym_id { 2 }
     trainer_id { 1 }
   end
 end
  