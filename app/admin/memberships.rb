ActiveAdmin.register Membership do
  permit_params :name, :discription,:price, :start_date,:start_date,:days,:end_date, :gym_id ,:gym_class_id  
  form do |f|
    f.inputs 'Membership Details' do
     f.input :gym, as: :select, collection: Gym.all, include_blank: 'Select Gym'
     f.input :gym_class, as: :select, collection: GymClass.all, include_blank: 'Select Class'
     f.input :name
     f.input :discription
     f.input :price
     f.input :days
    end
    f.actions
  end
end
 