class Postman < ActionMailer::Base
  
  def contact_message(msg)
    
    subject "Message from your website"
    body :message => msg
    recipients "#{MAIN_EMAIL}"
    from    "#{WEBSITE_EMAIL}"
  end
  
end
