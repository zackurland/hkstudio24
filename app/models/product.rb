class Product < ActiveRecord::Base
  monetize :production_rental_price_cents, allow_nil: true
  monetize :short_rental_price_cents, allow_nil: true

  has_one :photo, as: :assetable
  has_and_belongs_to_many :tags

  validates :name, :photo, presence: true

  accepts_nested_attributes_for :photo

  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }

  before_create :set_display_index

  private

  def set_display_index
    self.display_index = Product.order(display_index: :asc).last.try(:display_index).to_i + 1
  end

end
