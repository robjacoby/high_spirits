require "wiz_khilafa/email"
require "main/container"

module Main
  class Email < WizKhilafa::Email
    configure do |config|
      config.root = Container.root.join("emails")
      config.name = "email"
    end
  end
end
