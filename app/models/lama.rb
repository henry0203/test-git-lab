class Lama < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy

  validates :name, presence: true
  validates :category, presence: true
  validates :description, presence: true
  validates :address, presence: true
  validates :price, presence: true

  geocoded_by :full_address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch
  pg_search_scope :search_by_name_and_description,
    against: [ :name, :description ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  def full_address
    ("#{address}, #{zipcode}")
  end
end
