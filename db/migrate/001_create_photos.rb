class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.column :title, :string
      t.column :description, :text
      t.column :file, :string # Location of file on filesystem
      t.column :front_page_candidate, :boolean # Candidate for frount page random photo?
      
      t.column :created_at, :timestamp
      t.column :updated_at, :timestamp
      t.column :taken_at, :timestamp # For when the photo was actually taken.

    end
  end

  def self.down
    drop_table :photos
  end
end
