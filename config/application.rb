require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Assa
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2


    config.site = {
      name: "Assa"
    }
    config.i18n.default_locale = :fr
    config.time_zone = 'Africa/Porto-Novo'
    config.active_record.default_timezone = :local

    config.generators do |g|
      g.assets false
      g.helper false
      g.test_framework false
      g.jbuilder false
    end
  end
end
