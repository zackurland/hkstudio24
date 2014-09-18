class RentalsController < ApplicationController
  def create
    @rental = Rental.new(rental_params)

    if @rental.save
      @rental.extract_items(current_cart)
      redirect_to requested_rentals_path
    else
      render template: "carts/checkout"
    end
  end

  def requested
  end

  private

  def rental_params
    params.require(:rental).permit(:status, :start_date, :end_date, :production_name, :production_company, :billing_name, :billing_address, :billing_address_2, :billing_city,
      :billing_state, :billing_country, :billing_zip_code, :designer_name, :designer_phone_number, :designer_email, :your_name,
      :your_phone_number, :your_email, :filled_out_by_designer)
  end
end
