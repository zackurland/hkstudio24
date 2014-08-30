class Admin::RentalsController < AdminController

	def index
		@pendingRentals = Rental.where(status: "pending").count
		@approvedRentals = Rental.where(status: "approved").count
		@rejectedRentals = Rental.where(status: "rejected").count
	end

	def pending
		@pendingRentals = Rental.where(status: "pending")
	end

	def approved
		@approvedRentals = Rental.where(status: "approved")
	end

	def rejected
		@rejectedRentals = Rental.where(status: "rejected")
	end

end