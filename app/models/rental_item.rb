class RentalItem < ActiveRecord::Base
  belongs_to :rental
  belongs_to :product
end
