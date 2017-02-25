require "bugsnag"
require "rack/csrf"
require "dry-web-roda"
require "main/container"
require "roda_plugins"

module Main
  class Application < Dry::Web::Roda::Application
    configure do |config|
      config.routes = "web/routes".freeze
      config.container = Container
    end

    opts[:root] = Pathname(__FILE__).join("../..").realpath.dirname

    use Rack::Session::Cookie, key: "high_spirits.session", secret: HighSpirits::Container.settings.session_secret
    use Rack::Csrf, raise: true
    use Rack::MethodOverride
    use Bugsnag::Rack

    plugin :all_verbs
    plugin :error_handler
    plugin :flash

    plugin :page
    plugin :view

    def name
      :main
    end

    route do |r|
      r.root do
        r.view "home"
      end

      r.multi_route
    end

    error do |e|
      if ENV["RACK_ENV"] == "production"
        if e.is_a?(ROM::TupleCountMismatchError)
          response.status = 404
          self.class["main.views.errors.error_404"].(scope: current_page)
        else
          Bugsnag.auto_notify e
          self.class["main.views.errors.error_500"].(scope: current_page)
        end
      else
        Bugsnag.auto_notify e
        raise e
      end
    end

    load_routes!
  end
end
