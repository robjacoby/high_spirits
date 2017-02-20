WizKhilafa::Container.finalize :postmark do |container|
  require "postmark"
  container.register "postmark", Postmark::ApiClient.new(WizKhilafa::Container.settings.postmark_api_key)
end
