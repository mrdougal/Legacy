require "redcloth"
class Photo < ActiveRecord::Base
  
  acts_as_taggable
  image_column :file, :force_format => :jpg, :tmp_dir => "tmp", :store_dir => proc{ |inst, attr|"photos/#{inst.id}"},:versions => { 
          :thumb => "90x90", 
          :medium => "140x140", 
          :large => "700x700" }
  
  
  # 'Will paginate' preference
  cattr_reader :per_page
  @@per_page = 30

  validates_presence_of :title
  validates_presence_of :file, :on => :create
  
  before_save :generate_html
  after_save :destroy_uploaded_file
  
  private

  def generate_html
    self.description_html = RedCloth.new(self.description).to_html
  end
  
  def destroy_uploaded_file
    FileUtils.rm self.file.path, :force => true
  end
  
end
