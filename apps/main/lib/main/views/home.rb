require "main/view"

module Main
  module Views
    class Home < Main::View
      configure do |config|
        config.template = "home"
      end

      def locals(options = {})
        super.merge(
          cover_image_url: cover_image_url
        )
      end

      def cover_image_url
        attache_url_for("main/assets/main/public/scotch-on-wooden-background.jpg")
      end

      private

      def attache_url_for(file_path)
        prefix, basename = File.split(file_path)
        [HighSpirits::Container.settings.assets_server_url, "assets", prefix, CGI.escape(basename)].join("/")
      end
    end
  end
end
