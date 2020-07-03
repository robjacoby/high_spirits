require "dry/web/container"
require_relative "settings"

module HighSpirits
  class Container < Dry::Web::Container
    configure do |config|
      config.name = :core
      # config.settings_loader = HighSpirits::Settings
      config.auto_register = %w[lib/authentication]
    end

    load_paths! "lib", "system"

    def self.settings
      config.settings
    end
  end
end
