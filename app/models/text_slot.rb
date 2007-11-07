require "redcloth"
class TextSlot < ActiveRecord::Base
  
  validates_presence_of :page # This is the url of the page with the text slot
  before_save :generate_html
  
  private
  
  def generate_html
    self.body_html = RedCloth.new(self.body).to_html
  end
  
end
