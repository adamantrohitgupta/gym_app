ActiveAdmin.register GymClass do
  permit_params :name, :start_time, :end_time,:capacity, :description, :gym_id,:trainer_id,:images
  form do |f|
    f.inputs do
      f.input :name
      f.input :start_time
      f.input :end_time
      f.input :description
      f.input :capacity
      f.input :gym_id, as: :select, collection: Gym.all
      f.input :trainer_id, as: :select, collection: Trainer.all
      f.input :images, as: :file
      f.input :video,as: :file
    end
    f.actions
  end
end