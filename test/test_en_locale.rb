require 'test_helper'
class EnLocaleTest < Test::Unit::TestCase
  context "en locale" do
    setup do
      I18n.locale = :en
    end
    
    should "use another locale if specified" do
      assert_equal :en, I18n.locale
      assert_equal "(01) 2345 6789", PhoneNumber::PhoneNumber.new("0123456789", :locale => :"en-AU").to_s      
      assert_equal :en, I18n.locale      
    end
    
    should "parse 10 dight phone numbers" do
      ["(585) 555.1212", 5855551212, "585-555-1212", "585 555 1212", 15855551212, "1.585.555.1212",
        "1 (585) 555.1212", "1-585-555-1212"].each do |number| 
          assert_equal PhoneNumber::PhoneNumber.new(number).to_s, "(585) 555-1212", "#{number} did not parse correctly"
      end      
    end
    
    should "parse 10 digit phone numbers with extension" do
      ["(585) 555.1212 x13", "585-555-1212 ext 13", "585 555 1212 x13",  "1.585.555.1212 x 13",
        "1 (585) 555.1212 ext 13", "1-585-555-1212 ex 13"].each do |number| 
          assert_equal PhoneNumber::PhoneNumber.new(number).to_s, "(585) 555-1212 x13", "#{number} did not parse correctly"
      end
    end
    
    should "parse 7 digit phone numbers" do
      [1234567, "123.4567", "1234567", "123-4567"].each do |number|
        assert_equal PhoneNumber::PhoneNumber.new(number).to_s, "123-4567", "#{number} did not parse correctly"
      end      
    end
    should "parse into h264 format" do
      ["(585) 555.1212", 5855551212, "585-555-1212", "585 555 1212", 15855551212, "1.585.555.1212",
        "1 (585) 555.1212", "1-585-555-1212"].each do |number| 
          assert_equal PhoneNumber::PhoneNumber.new(number).to_s(:h264), "+15855551212", "#{number} did not parse correctly"
      end    
    end
  end

end