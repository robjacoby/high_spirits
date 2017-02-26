require 'high_spirits/validation'

module Main
  module Validation
    module BlendedWhiskies
      Form = HighSpirits::Validation.Form do
        required(:volume).filled(:int?)
        required(:whisky_id).filled(:int?)
      end
    end
  end
end
