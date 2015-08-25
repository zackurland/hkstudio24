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

  product_ids = Product.joins(:tags).where(tags: {id: @tag_ids}).group(:product_id).count.keep_if{|k, v| v >= params[:q].count}.keys
  @products = Product.includes(:tags).where(products: { id: product_ids}).uniq

  def self.filter(tag_hash)
    tag_ids = tag_hash.values.flatten
    product_ids = Product.joins(:tags).where(tags: {id: tag_ids}).group(:product_id).count.keep_if{|k, v| v >= tag_hash.count}.keys
    Product.includes(:tags).where(products: { id: product_ids}).uniq
  end

  private

  def set_display_index
    self.display_index = Product.order(display_index: :asc).last.try(:display_index).to_i + 1
  end

end
