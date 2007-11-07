# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
    
  include AuthenticatedSystem
  before_filter :login_from_cookie
  session :session_key => '_silvana_session_id'
  
  helper :photos, :text_slots

  # This is for a smarter 404 page
  def method_missing(method_name, *args)
    render '/shared/not_found'  
  end
    
end
