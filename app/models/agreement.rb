class Agreement < ActiveRecord::Base
  has_one :pdf, as: :assetable

  accepts_nested_attributes_for :pdf
end
