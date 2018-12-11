class Review < ApplicationRecord
  belongs_to :lama
  belongs_to :user

  validates :description, presence: true
  validates :rating, presence: true
  validates :user, presence: true
  validates :lama, presence: true

  validates :user, uniqueness: { scope: :lama }
end
