class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :lama

  validates :date_begin, presence: true
  validates :date_end, presence: true
  validates :user, presence: true
  validates :lama, presence: true

end
