require 'test_helper'

class SlideTest < ActiveSupport::TestCase
  test 'associations' do
    assert slides(:one).language == languages(:one)
  end

  test 'validations presence' do
    assert_not slides(:one).update target_script: nil
    assert_not slides(:one).update target_ipa: nil
    assert_not slides(:one).update english_latin: nil
  end

  test 'validations uniqueness' do
    assert_not languages(:one).slides.new(
      target_script: slides(:one).target_script,
      target_ipa: slides(:one).target_ipa,
      english_latin: slides(:one).english_latin
    ).save

    assert languages(:one).slides.new(
      target_script: slides(:one).target_script,
      target_ipa: slides(:one).target_ipa,
      english_latin: 'Something else'
    ).save
  end
end
