class HomepageController < ApplicationController


  def index
    # This is the page that is called to render the homepage
    @photo = Photo.homepage_pic
    @message = TextSlot.find_by_page('homepage')
  end
  
end
