require "stripe"
Rails.configuration.stripe = {
  publishable_key: "pk_test_51OP1h8SDRdUEHVJoX34uGzQh6N4fW3iifmzV7yhTkHz0ElBa2aiN71JblRxNQHislUnm1wiA1VhrcibYEiDREYvT000BYWPSXP",
  secret_key: "sk_test_51OP1h8SDRdUEHVJoPkNsmari9DgQXAcNAmLri20Ecg635hUJiIXxH5g1djL7Q4viCzldM80fusv0nwFKfmCg65Iy0042pyGFPJ"
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]