class PhotosController < ApplicationController

  before_filter :login_required, :except => [:index, :show, :tagged]
  before_filter :show_all_tags, :except => [:create, :update, :destroy]
  before_filter :find_photo, :only => [:show, :edit, :update, :destroy]


  def index
    @photos = Photo.paginate(:all, :page => params[:page], :order => 'created_at desc')
  end
  
  def tagged
    
    @photos = Photo.find_tagged_with(params[:id])
    @active_tags = Tag.find_all_by_name(params[:id])
    
    # If only one photo, then we'll redirect to that photos page
    redirect_to photo_path(@photos.first) if (@photos.size == 1)
    
    # Show no photos found
    render :action => 'no_photo' if @photos.empty?  
    
  end

  def show
    
    # Find photos that are related to the one that we're viewing
    @related_photos = Photo.find_tagged_with(@photo.tag_list, :conditions => "photos.id <> #{@photo.id}")
  end

  def new
    @photo = Photo.new
  end

  def edit
    #
  end

  def create
    @photo = Photo.new(params[:photo])

    if @photo.save
      flash[:notice] = "#{CGI::escapeHTML(@photo.title)} was successfully created"
      redirect_to photo_url(@photo)
    else
      render :action => "new"
    end
  end

  def update

    if @photo.update_attributes(params[:photo])
      flash[:notice] = "#{CGI::escapeHTML(@photo.title)} was successfully updated"
      redirect_to photo_url(@photo)
    else
      render :action => "edit"
    end
  end

  def destroy
    @photo.destroy
    flash[:notice] = "Photo #{CGI::escapeHTML(@photo.title)} was deleted"
    redirect_to photos_url
  end
  
  def no_photo
    
  end
  
  private
  
  def show_all_tags
    @tags = Photo.tag_counts(:order => "name asc")
    @active_tags = [] # will be written over if needed
  end
  
  def find_photo
    begin
      @photo = Photo.find(params[:id])
      @active_tags = @photo.tags
    rescue ActiveRecord::RecordNotFound
      render :action => 'no_photo'
    end
  end
  
end
