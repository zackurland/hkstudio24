class RentalMailer < ActionMailer::Base
  default from: "from@example.com"

  def invoice(rental)
    @rental = rental
    mail(to: @rental.contact_email, subject: "HK STUDIO Invoice ##{@rental.id + 1000}")
  end
end
