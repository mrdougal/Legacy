class HelpController < ApplicationController
  
  before_filter :login_required
  
  def show
    #
  end
  
  def textile
    render :partial => 'help/textile_ref' if request.xhr?
  end
  
end
