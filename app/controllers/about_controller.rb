class AboutController < ApplicationController
  
  def show
    @message = TextSlot.find_by_page('contact')
  end
  
  # Display a contact form
  def contact
    if request.post?
      @message = Contact.new(params['message'])
      if @message.valid?
       Postman.deliver_contact_message(@message)
       render :action => 'sent'
      end
    else
      @message = Contact.new
    end
  end
  
  def vcard
    send_file "#{RAILS_ROOT}/app/views/about/silvana.vcf"
  end
  
end
