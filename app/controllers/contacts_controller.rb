class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request

    if @contact.deliver
      flash[:notice] = "Message sent."
      redirect_to new_contacts_path
    else
      render :new
    end
  end
end
