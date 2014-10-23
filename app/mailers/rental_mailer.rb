class RentalMailer < ActionMailer::Base
  default from: "noreply@hkstudiorentals.com"

  def invoice(rental)
    @rental = rental
    mail(to: @rental.contact_email, subject: "HK STUDIO Invoice ##{@rental.id + 1000}")
  end

  def agreement(rental, pdf)
    @rental = rental
    attachments["hkstudio_rental_agreement_#{1000 + @rental.id}"] = pdf
    mail(to: @rental.contact_email, subject: "HK STUDIO Rental Agreement")
  end
end
