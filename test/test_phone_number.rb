require 'test_helper'
class PhoneNumberTest < Test::Unit::TestCase
  
  def test_i81n_loaded
    assert_equal I18n.t("phone_number.formats").class, Array
    assert_equal I18n.locale, :en
  end
  


end