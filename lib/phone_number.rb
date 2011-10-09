require "phone_number/version"
require "phone_number/phone_number"
require "i18n"
I18n.load_path += Dir[(File.dirname(__FILE__) + '/data/*.yml')]
require "core_ext/hash" unless Hash.new.respond_to?(:symbolize_keys)
