HighSpirits::Container.finalize :postmark do |container|
  require "postmark"
  container.register "postmark", Postmark::ApiClient.new(HighSpirits::Container.settings.postmark_api_key)
end
