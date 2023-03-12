class Student < ApplicationRecord
  validates :email, presence: true

  has_many :visits, -> { order created_at: :desc }
  has_many :visited_slides, through: :visits, source: :slide
end
