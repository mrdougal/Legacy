class Contact < Tableless
	
	column :name, :string
	column :email_address, :string
	column :message, :text
	column :response, :text
	

	RESPONSE_OPTIONS = [
		['','nothing'],
    [ 'email me', 'email'],
    [ 'call me', 'call me'],
    [ "It's beer o'clock!", 'beer!']
  ]
	
	validates_presence_of :name, :message => "can't be blank."
	validates_presence_of :email_address, 
												:message => "will need to be included, if you want me to email you back", 
												:if => :email_required?

	validates_format_of :email_address, :with => Format::EMAIL, :message => "doesn't appear to be a valid."
	validates_length_of :message, :minimum => 1, :message => " doesn't have anything written in it"
	validates_inclusion_of :response, :in => RESPONSE_OPTIONS.map {|disp, value| value}
	
	protected
	
	def email_required?
    self.response == 'email'
  end
	
end
