require 'test_helper'

class LanguageTest < ActiveSupport::TestCase
  setup do
    @language = languages :one
    @slide = slides :one
    @other_language = languages :two
  end

  test 'associations' do
    assert @language.slides.include? @slide

    @language.destroy
    assert_raises(ActiveRecord::RecordNotFound) { @slide.reload }
  end

  test 'validations' do
    assert_raises(ActiveRecord::RecordInvalid) do
      @language.update! name: @other_language.name
    end
    assert_raises(ActiveRecord::RecordInvalid) do
      @language.update! iso_639_1: @other_language.iso_639_1
    end
  end

  test 'alias' do
    assert @language.abbreviation == @language.iso_639_1
  end

  test 'downcase' do
    language = Language.create name: 'Fakeish', abbreviation: 'fa'
    assert language.name == 'fakeish'
    language.update! name: 'Fakeish'
    language.reload
    assert language.name == 'fakeish'
  end
end
