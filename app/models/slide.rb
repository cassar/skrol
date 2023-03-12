class Slide < ApplicationRecord
  belongs_to :language

  validates :target_script, :target_ipa, :english_latin, presence: true
  validates :target_script, uniqueness: {
    scope: [:target_ipa, :english_latin, :language_id],
    case_sensitive: true,
    message: "Slide needs to be unique"
  }
end
