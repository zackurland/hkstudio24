class Admin::RentalsController < AdminController
	before_action :navigation

	def index
		@pending_rentals = Rental.where(status: "pending").count
		@approved_rentals = Rental.where(status: "approved").count
		@rejected_rentals = Rental.where(status: "rejected").count
	end

	def show
		@rental = Rental.find(params[:id])
	end

	def edit
		@rental = Rental.find(params[:id])
	end

	def update
		@rental = Rental.find(params[:id])

		if @rental.update_attributes(rental_params)
			redirect_to admin_rental_path(@rental)
		else
			render :edit
		end
	end

	def pending
		@pending_rentals = Rental.where(status: "pending")
	end

	def approved
		@approved_rentals = Rental.where(status: "approved")
	end

	def rejected
		@rejected_rentals = Rental.where(status: "rejected")
	end

	def send_invoice
		@rental = Rental.find(params[:id])
		RentalMailer.invoice(@rental).deliver
		redirect_to admin_rental_path(@rental)
	end

	private

	def rental_params
		params.require(:rental).permit(:start_date, :end_date, :status, :discount_percentage, :include_tax, items_attributes: [:id, :price, :_destroy])
	end

	def navigation
		@admin_navigation = "rentals"
	end

end
