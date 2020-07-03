require "dry/system/settings"
require "dry-types"

module HighSpirits
  class Settings < Dry::System::Settings::Configuration
    module Types
      include Dry.Types(default: :nominal)

      module Required
        String = Types::Strict::String.constrained(min_size: 1)
      end
    end

    setting :database_url, Types::Required::String
    setting :session_secret, Types::Required::String

    setting :assets_server_url, Types::Required::String
    setting :precompiled_assets, Types::Bool.default(false)
    setting :precompiled_assets_host, Types::String

    setting :app_mailer_from_email, Types::String

    setting :bugsnag_api_key, Types::String

    setting :postmark_api_key, Types::String
  end
end
