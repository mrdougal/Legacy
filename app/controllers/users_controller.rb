class UsersController < ApplicationController
  
  
	before_filter :login_required
	before_filter :find_user, :only => [:show ,:edit, :update, :destroy]
	
  def index
    @users = User.find(:all)
  end

  
  def new
    # render new.rhtml
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "#{CGI::escapeHTML(@user.login)} was successfully created..."
      redirect_to user_path(@user)
    else
      render :action => 'new'      
    end
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:notice] = "#{CGI::escapeHTML(@user.login)} was successfully updated."
      redirect_to user_url(@user)
    else
      render :action => "edit"
    end
  end
  
  def destroy
		@user.destroy
	  flash[:notice] = "#{CGI::escapeHTML(@user.login)} was deleted..."
    redirect_to users_path
  end


	def show
		#
	end
	
	def edit
		#
	end

  #   def activate
  #     self.current_user = User.find_by_activation_code(params[:id])
  #     if logged_in? && !current_user.activated?
  #       current_user.activate
  #       flash[:notice] = "Signup complete!"
  #     else
  #       flash[:notice] = "Invalid, activation code"
  #       redirect_to '/'
  #     end
  #   end
  # 
  # def forgot_password
  #   
  #   if request.post?
  #     @user = User.find_by_email(params[:email_address])
  #     if @user
  #       render '/users/sent_remember_token'
  #       return
  #     else
  #       flash.now[:notice] = "Nobody found with that email address"
  #     end
  #   end
  #     render :partial => '/users/forgot_password_form', :layout => !request.xhr?
  #   
  # end


	protected
	
	def find_user
		begin
			@user = User.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			flash[:notice] = "User not found..."
			redirect_to users_path
		end
	end

end
