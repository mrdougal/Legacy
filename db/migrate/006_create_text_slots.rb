class CreateTextSlots < ActiveRecord::Migration
  def self.up
    create_table :text_slots, :force => true do |t|
      t.column :page, :string
      t.column :body, :text
      t.column :body_html, :text
      t.column :updated_at, :datetime
    end
    
    h = TextSlot.new
    h.page = 'homepage'
    h.body = "h1.Hi I'm Silvana and I take photos"
    h.body << "\nWelcome to my website"
    h.save
    
    c = TextSlot.new
    c.page = 'contact'
    c.body = 'h1.Use this form to get in contact with me'
    c.save
    
  end

  def self.down
    drop_table :text_slots
  end
end
