class Contact < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message,   :validate => true
  attribute :company,   :validate => true
  attribute :to,        :validate => true
  attribute :website

  def headers
    {
      :subject => subject,
      :to => to,
      :from => %("#{name}" <#{email}>)
    }
  end
end
