# phone_number

## Description

phone_number is a ruby gem that will format a given telephone number into a format appropriate for the locale. 

## Installation

### via RubyGems


    [sudo] gem install phone_number

###  via Bundler (Rails 3 or other Bundler-aware frameworks)

Add this to your Gemfile:

    gem "phone_number"
  
## Usage
  
    require "phone_number"
    I18n.locale = :en
  
    p=PhoneNumber::PhoneNumber.new "585.555.1212"
      #=> #<PhoneNumber::PhoneNumber:0x10256b8e8 @locale=:en, @number="585.555.1212"> 

    p.to_s
      #=> "(585) 555-1212" 

    p.to_s :h264
      #=> "+15855551212" 

    p=PhoneNumber::PhoneNumber.new "+1 585-555-1212"
      #=> #<PhoneNumber::PhoneNumber:0x10252ff28 @locale=:en, @number="+1 585-555-1212"> 

    p.to_s
      #=> "(585) 555-1212" 

    p=PhoneNumber::PhoneNumber.new "+1 585.555 1212"
      #=> #<PhoneNumber::PhoneNumber:0x102526798 @locale=:en, @number="+1 585.555 1212"> 

    p.to_s
      #=> "(585) 555-1212" 

    PhoneNumber::PhoneNumber.new("0123456789", :locale => :"en-AU").to_s  
      #=> "(01) 2345 6789"

    I18n.locale = :"en-AU"
      #=> :"en-AU"

    PhoneNumber::PhoneNumber.new("0123456789").to_s  
      => "(01) 2345 6789"


## Dependencies

phone_number depends on the [I18n gem](https://github.com/svenfuchs/i18n/).

## Contribute

