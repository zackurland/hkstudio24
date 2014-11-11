class Page < ActiveRecord::Base
  has_many :editables

  accepts_nested_attributes_for :editables
end
