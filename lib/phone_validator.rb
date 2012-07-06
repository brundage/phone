require 'phone'
require 'active_model'
require 'active_support/all'
require 'active_model/validations'
module Phoner
  class PhoneValidator < ActiveModel::EachValidator
    def validate_each(record,attribute,value)
      unless value.is_a?(Phoner::Phone) && Phoner::Phone.valid?(value)
        record.errors[attribute] << (options[:message] || "is an invalid phone number")
      end
    end
  end
end
