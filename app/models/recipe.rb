class Recipe < ApplicationRecord
  belongs_to :category
  belongs_to :user  # これが必要です
  has_one_attached :image  # 画像をActiveStorageで管理する
  has_many :ingredients, dependent: :destroy
  has_many :steps, dependent: :destroy

  accepts_nested_attributes_for :ingredients, allow_destroy: true
  accepts_nested_attributes_for :steps, allow_destroy: true

  validates :title, presence: true
  validates :serving_size, numericality: { only_integer: true, greater_than: 0 }
end
