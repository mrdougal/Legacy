class AboutController < ApplicationController
  
    before_filter :build_nav
  
  def show
    # Perhaps show a photo of self
    @photo = Photo.find_tagged_with('self portrait', :order => 'RAND()', :limit => '1').first
    
  end
  
  def contact
    # Display a contact form
  end
  
  def vcard
    send_file "#{RAILS_ROOT}/app/views/about/silvana.vcf"
  end


  private
  
  def build_nav


      @subnav = []
      @subnav << {:name => 'Contact me', 
                  :url => {:action => 'contact'}, 
                  :options => { 
                    :title => 'Fill in a form and say hello'
                    }}
                    
      @subnav << {:name => 'V-card', 
                  :url => {:action => 'vcard'}, 
                  :options => { 
                    :title => 'Click to get my v-card'
                    }}
  end
  
end
