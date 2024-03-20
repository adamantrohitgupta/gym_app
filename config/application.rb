require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module GymApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    config.i18n.default_locale = :en
    config.i18n.available_locales = [:en, :hi]

    
    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.stripe = {
       publishable_key: "pk_test_51OP1h8SDRdUEHVJoX34uGzQh6N4fW3iifmzV7yhTkHz0ElBa2aiN71JblRxNQHislUnm1wiA1VhrcibYEiDREYvT000BYWPSXP",
      secret_key: "sk_test_51OP1h8SDRdUEHVJoPkNsmari9DgQXAcNAmLri20Ecg635hUJiIXxH5g1djL7Q4viCzldM80fusv0nwFKfmCg65Iy0042pyGFPJ"
    }
  end 
end
