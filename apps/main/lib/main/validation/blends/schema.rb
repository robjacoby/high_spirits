require 'high_spirits/validation'

module Main
  module Validation
    module Blends
      Schema = HighSpirits::Validation.Schema do
        required(:bottle_id).filled(:int?)
        required(:total_amount).filled(:int?)
      end
    end
  end
end
