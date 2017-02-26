require 'high_spirits/validation'

module Main
  module Validation
    module Measures
      Form = HighSpirits::Validation.Form do
        required(:bottle_id).filled(:int?)
        required(:whisky_id).filled(:int?)
        required(:volume).filled(:int?)
      end
    end
  end
end
