class Product < ActiveRecord::Base
  monetize :production_rental_price_cents
  monetize :short_rental_price_cents

  has_one :photo, as: :assetable
  has_and_belongs_to_many :tags

  validates :name, :photo, presence: true

  accepts_nested_attributes_for :photo
end
