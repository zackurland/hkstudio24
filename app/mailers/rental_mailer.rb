class RentalMailer < ActionMailer::Base
  default from: "noreply@hkstudiorentals.com"

  def invoice(rental)
    @rental = rental
    mail(to: @rental.contact_email, cc: Editable.where(name: "Email").last.text, subject: "HK STUDIO Invoice ##{@rental.id + 1000}")
  end

  def agreement(rental, pdf_url)
    @rental = rental
    pdf = open(pdf_url)
    attachments["hkstudio_rental_agreement_#{1000 + @rental.id}.pdf"] = pdf.read
    mail(to: @rental.contact_email, cc: Editable.where(name: "Email").last.text, subject: "HK STUDIO Rental Agreement")
  end
end
