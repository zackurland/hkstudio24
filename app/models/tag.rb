class Tag < ActiveRecord::Base
  belongs_to :category
  has_and_belongs_to_many :products

  validates :name, presence: true
end
