ActiveAdmin.register Trainer do
  permit_params :name, :experience, :specialist, :email, :phone ,:image
  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :specialist
      f.input :experience
      f.input :phone
      f.input :image,as: :file
    end
    f.actions
  end
end
