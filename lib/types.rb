require "dry-types"
require "dry-struct"

module Types
  include Dry::Types.module

  SymbolizedHash = Types::Strict::Hash.constructor -> input {
    input = input.to_h unless input.respond_to?(:inject)
    input.inject({}) { |result, (key, value)|
      new_key         = case key
                        when ::String then
                          key.to_sym
                        else
                          key
                        end
      new_value       = case value
                        when ::Hash then
                          SymbolizedHash.call(value)
                        when ::Array then
                          value.map { |v| SymbolizedHash.call(v) }
                        else
                          value
                        end
      result[new_key] = new_value

      result
    }
  }

end
