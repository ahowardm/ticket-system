require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TicketSystem
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    config.time_zone = "America/Santiago"
    # config.eager_load_paths << Rails.root.join("extras")
    config.i18n.default_locale = 'es'
    config.i18n.fallbacks = ['es']
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', 'models', '**', '*.yml').to_s]
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', 'views', '**', '*.yml').to_s]
  end
end
