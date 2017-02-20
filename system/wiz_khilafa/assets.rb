require "open-uri"

module WizKhilafa
  class Assets
    attr_reader :root
    attr_reader :precompiled
    attr_reader :precompiled_host
    attr_reader :server_url

    def self.new(container = WizKhilafa::Container)
      super(
        root: container.config.root,
        precompiled: container.settings.precompiled_assets,
        precompiled_host: container.settings.precompiled_assets_host,
        server_url: container.settings.assets_server_url,
      )
    end

    def initialize(root:, precompiled:, precompiled_host: nil, server_url: nil)
      @root = root
      @precompiled = precompiled
      @precompiled_host = precompiled_host
      @server_url = server_url
    end

    def [](asset)
      if precompiled
        asset_path_from_manifest(asset)
      else
        asset_path_on_server(asset)
      end
    end

    def read(asset)
      path = self[asset]

      if File.exist?(path)
        File.read(path)
      else
        open(path, "r:UTF-8").read
      end
    end

    private

    def asset_path_from_manifest(asset)
      if (hashed_asset = manifest["assets"][asset])
        "#{precompiled_host}/assets/#{hashed_asset}"
      end
    end

    def asset_path_on_server(asset)
      "#{server_url}/assets/#{asset}"
    end

    def manifest
      @manifest ||= YAML.load_file(manifest_path)
    end

    def manifest_path
      Dir["#{root}/public/assets/manifest_*.json"].first
    end
  end
end
