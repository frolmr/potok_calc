require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PotokCalc
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.cache_store = :redis_store, "redis://h:p224624ea212f9d6faf427a41a6a41b1804e86b9508d8d5ebbae9c6a5f136c0f4@ec2-34-203-180-66.compute-1.amazonaws.com:52279"
  end
end
