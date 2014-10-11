class Category < ActiveRecord::Base
  has_many :tags, dependent: :destroy

  accepts_nested_attributes_for :tags

  validates :name, presence: true

  before_create :display_last

  def display_last
    category = Category.order(:display_index).last
    if category
      self.display_index = category.display_index + 1
    else
      self.display_index = 0
    end
  end
end
