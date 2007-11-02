class AddRedclothToPhotos < ActiveRecord::Migration
  def self.up
    
    add_column :photos, :description_html, :text
    
    Photo.reset_column_information
    Photo.find(:all).each do |p|
      p.update_attribute :description_html, RedCloth.new(p.description).to_html
    end
  end

  def self.down
    remove_column :photos, :description_html
  end
end
