class TextSlotsController < ApplicationController
  
  before_filter :login_required
  in_place_edit_for :text_slot, :body

  
  # GET /text_slots
  # GET /text_slots.xml
  def index
    @text_slots = TextSlot.find(:all)

    respond_to do |format|
      format.html # index.rhtml
      format.xml  { render :xml => @text_slots.to_xml }
    end
  end

  # GET /text_slots/1
  # GET /text_slots/1.xml
  def show
    @text_slot = TextSlot.find(params[:id])

    respond_to do |format|
      format.html # show.rhtml
      format.xml  { render :xml => @text_slot.to_xml }
    end
  end

  # GET /text_slots/new
  def new
    @text_slot = TextSlot.new
  end

  # GET /text_slots/1;edit
  def edit
    @text_slot = TextSlot.find(params[:id])
  end

  # POST /text_slots
  # POST /text_slots.xml
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

  # PUT /text_slots/1
  # PUT /text_slots/1.xml
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

  # DELETE /text_slots/1
  # DELETE /text_slots/1.xml
  def destroy
    @text_slot = TextSlot.find(params[:id])
    @text_slot.destroy

    respond_to do |format|
      format.html { redirect_to text_slots_url }
      format.xml  { head :ok }
    end
  end
end
