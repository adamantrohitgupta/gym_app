class MyjobJob < ApplicationJob
  queue_as :default

  def perform(session_id)
    session = Stripe::Checkout::Session.retrieve(session_id)
    payment_intent = session.payment_intent
    Stripe::PaymentIntent.capture(payment_intent)
  end
end
