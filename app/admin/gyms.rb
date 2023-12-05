ActiveAdmin.register Gym do

  permit_params :name, :discription,:images
  
  form do |f|
    f.inputs do
      f.input :name
      f.input :discription
      f.input :images, as: :file
    end
    f.actions
  end
  
end
