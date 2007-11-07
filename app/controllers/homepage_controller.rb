class HomepageController < ApplicationController

  before_filter :find_text_slot

  def index
    # This is the page that is called to render the homepage
    @photo = Photo.homepage_pic
  end
  
  def get_message_body
    render :text => @message.body
  end
  
  def set_message_body
    @message = TextSlot.find_by_page('homepage')
    @message.update_attribute('body',params[:value])
    @message.save
    @message.reload
    render :text => @message.body_html.to_s
  end
  
  private
  
  def find_text_slot
    @message = TextSlot.find_by_page('homepage')
  end
  
end
