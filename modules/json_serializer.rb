# frozen_string_literal: true

require 'json'

# JSON Serializer module
module JsonSerializer
  def serialize
    hash = {}

    instance_variables.each do |var|
      hash[var] = instance_variable_get var
    end

    JSON.pretty_generate(hash)
  end

  def deserialize(string)
    JSON.parse(string).each do |var, val|
      instance_variable_set var, val
    end
  end
end
