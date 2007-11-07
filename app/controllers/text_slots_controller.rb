class TextSlotsController < ApplicationController
  
  before_filter :login_required
  before_filter :find_text_slot, :only => [:get_message_body, :set_message_body]
  # in_place_edit_for :text_slot, :body

  
  def index
    @text_slots = TextSlot.find(:all)

    respond_to do |format|
      format.html # index.rhtml
      format.xml  { render :xml => @text_slots.to_xml }
    end
  end

  def show
    @text_slot = TextSlot.find(params[:id])

    respond_to do |format|
      format.html # show.rhtml
      format.xml  { render :xml => @text_slot.to_xml }
    end
  end

  def new
    # Can't just create
  end

  def edit
    @text_slot = TextSlot.find(params[:id])
  end

  def create
    @text_slot = TextSlot.new(params[:text_slot])

    respond_to do |format|
      if @text_slot.save
        flash[:notice] = 'TextSlot was successfully created.'
        format.html { redirect_to text_slot_url(@text_slot) }
        format.xml  { head :created, :location => text_slot_url(@text_slot) }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @text_slot.errors.to_xml }
      end
    end
  end

  def update
    @text_slot = TextSlot.find(params[:id])

    respond_to do |format|
      if @text_slot.update_attributes(params[:text_slot])
        flash[:notice] = 'TextSlot was successfully updated.'
        format.html { redirect_to text_slot_url(@text_slot) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @text_slot.errors.to_xml }
      end
    end
  end

  def destroy
    respond_to do |format|
      format.html { redirect_to text_slots_url }
      format.xml  { head :ok }
    end
  end
  
  
  def get_message_body
    render :text => @message.body
  end
  
  def set_message_body
    # @message = TextSlot.find_by_page('homepage')
    @message.update_attribute('body',params[:value])
    @message.save
    @message.reload
    render :text => @message.body_html.to_s
  end
  
  private
  
  def find_text_slot
    @message = TextSlot.find(params[:id])
  end
  
end
