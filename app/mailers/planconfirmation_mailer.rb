class PlanconfirmationMailer < ApplicationMailer
 default from: email_address_with_name('rohgupta@bestpeers.in', 'cult fit ')

  def plan_notification(object,plan)
   @user = object
   @plan = plan
   @url  = 'http://example.com/login'
   # attachments.inline['ram.jpg'] = File.read('public/images/ram.jpg')
   mail to: @user.email,  subject: "regarding to buy a new plan"     
  end

end
