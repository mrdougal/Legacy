ActionController::Routing::Routes.draw do |map|


	map.resources *%w(sessions users photos)
	map.resource *%w(help about)

  map.resource :help, :collection => {:textile => :get}

  # The priority is based upon order of creation: first created -> highest priority.
  
  # Sample of regular route:
  # map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  map.tagged 'photos/tagged/:id', :controller => 'photos', :action => 'tagged'
  
  map.with_options :controller => 'users' do |users|
    users.activate 'activate/:id', :action => 'activate'
    users.forgot_password 'forgot_password', :action => 'forgot_password'
  end
  
  map.with_options :controller => 'sessions' do |sessions|
		sessions.login  'login', :action => 'new'
		sessions.logout  'logout', :action => 'destroy'
	end
	
	map.with_options :controller => 'about' do |about|
	  about.vcard 'vcard', :action => 'vcard'
  end

  # Sample of named route:
  # map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # You can have the root of your site routed by hooking up '' 
  # -- just remember to delete public/index.html.
  map.connect '', :controller => "photos", :action => 'homepage'

  # Allow downloading Web Service WSDL as a file with an extension
  # instead of a file named 'wsdl'
  map.connect ':controller/service.wsdl', :action => 'wsdl'

  # Install the default route as the lowest priority.
  map.connect ':controller/:action/:id.:format'
  map.connect ':controller/:action/:id'
end
