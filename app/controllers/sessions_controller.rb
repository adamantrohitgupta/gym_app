class SessionsController < Devise::SessionsController
 
 def create 
    super do |resource|
      resource.update(last_login_at: Time.zone.now) if resource.persisted?
      end
 end
end
