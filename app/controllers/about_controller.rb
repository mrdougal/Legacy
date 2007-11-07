class AboutController < ApplicationController
  
  before_filter :find_text_slot, :except => [:contact]
  
  def show
    # Perhaps show a photo of self
    @photo = Photo.find_tagged_with('self portrait', :order => 'RAND()', :limit => '1').first
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
  
  def get_message_body
    render :text => @message.body
  end
  
  def set_message_body
    @message.update_attribute('body',params[:value])
    @message.save
    @message.reload
    render :text => @message.body_html.to_s
  end
  


  private
  
  def find_text_slot
    @message = TextSlot.find_by_page('contact')
  end
  
  
end
