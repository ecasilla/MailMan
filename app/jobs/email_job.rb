module SendBackgroundEmail

  @queue = :default

  def self.perform(from_email, email_params)
    # Code in here is what happens when this executed by the worker
    email_to = email_params["email_destination"]
    email_subject = email_params["email_subject"]
    email_body = email_params["email_body"]
    Mail.deliver do
      to    email_to
      from  from_email
      subject email_subject
      body  email_body
    end
  end
end