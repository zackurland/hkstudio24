class Category < ActiveRecord::Base
  has_many :tags, dependent: :destroy

  accepts_nested_attributes_for :tags

  validates :name, presence: true
end
