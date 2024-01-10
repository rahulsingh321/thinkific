# frozen_string_literal: true

require 'yaml'

class Thinkific
  # Defines helper methods.
  module Helpers
    module_function

    # Convert a hash (recursively) to use symbol hash keys
    # @return [Hash]
    def symbolize_keys(hash)
      if hash.is_a?(Hash)
        hash = hash.each_with_object({}) do |(key, value), new_hash|
          new_hash[key.to_sym] = symbolize_keys(value)
        rescue NoMethodError
          raise "Error: cannot convert hash key to symbol: #{key}"
        end
      end

      hash
    end

    # Check if arg is a color in 6-digit hex notation with leading '#' sign
    def hex_color?(arg)
      pattern = /\A#\h{6}\Z/

      pattern.match(arg)
    end

    # YAML::load on a single argument
    def yaml_load(arg)
      hex_color?(arg) ? arg : YAML.safe_load(arg)
    rescue Psych::SyntaxError
      raise "Error: Argument is not valid YAML syntax: #{arg}"
    end
  end
end
