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
     f.input :start_date
    end
    f.actions
  end
end
  
# ActiveAdmin.register Membership do
#   permit_params :name, :discription,:price, :start_date, :end_date, :gym_id, :gym_class_id

#   form do |f|
#     f.inputs 'Membership Details' do
#       
#       f.input :gym, as: :select, collection: Gym.all, include_blank: 'Select Gym', associated: true
#       f.input :gym_class, as: :select, collection: GymClass.where(gym_id: f.object.gym_id), include_blank: 'Select Class'
#       f.input :name
#       f.input :discription
#       f.input :price
#     end
#     f.actions
#   end
# end