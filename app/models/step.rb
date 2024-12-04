class Step < ApplicationRecord
  belongs_to :recipe
  has_one_attached :image # For the step image

  validates :description, presence: true
end
