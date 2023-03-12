class Language < ApplicationRecord
  has_many :slides, dependent: :destroy

  before_validation :downcase_name

  validates_uniqueness_of :name, :iso_639_1

  alias_attribute :abbreviation, :iso_639_1

  def to_param
    name
  end

  def title
    name.titleize
  end

  private

  def downcase_name
    self.name = name.downcase
  end
end
