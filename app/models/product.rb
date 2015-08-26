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

  def self.filter(tag_hash)
    product_id_counts = {}
    tag_hash.each do |category_id, tag_ids|
      Product.joins(:tags).where(tags: { id: tag_ids}).group(:id).map(&:id).each do |product_id|
        product_id_counts[product_id] ||= 0
        product_id_counts[product_id] = product_id_counts[product_id] + 1
      end
    end
    Product.where(id: product_id_counts.keep_if{|k, v| v >= tag_hash.count }.keys)
  end

  def would_show_up_for(tag_hash)
    category_check = true
    tag_hash.each do |category_id, tag_ids|
      if category_check == true
        category_check = (tag_ids & self.tag_ids.map(&:to_s)).present?
      end
    end
    category_check
  end

  def categories
    tags.map(&:category)
  end

  private

  def set_display_index
    self.display_index = Product.order(display_index: :asc).last.try(:display_index).to_i + 1
  end

end
