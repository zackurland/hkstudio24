class Contact < MailForm::Base
  attribute :to,        :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :name,      :validate => true
  attribute :company,   :validate => true
  attribute :website
  attribute :message,   :validate => true

  def headers
    {
      :subject => "HK Studio Contact",
      :to => to,
      :from => %("#{name}" <#{email}>)
    }
  end
end
