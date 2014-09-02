class Rental < ActiveRecord::Base
  has_many :items, class_name: "RentalItem"
end
