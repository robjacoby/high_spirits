require "wiz_khilafa/import"

module WizKhilafa
  class Mailer
    include WizKhilafa::Import("logger", "postmark")

    def deliver(mail)
      logger.debug("[WizKhilafa::Mailer] delivering: #{mail.inspect}")
      postmark.deliver(mail.to_h.merge(from: from))
    end

    private

    def from
      options.app_mailer_from_email
    end

    def options
      Container.settings
    end
  end
end
