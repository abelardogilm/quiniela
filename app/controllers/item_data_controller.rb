class ItemDataController < ApplicationController
  # GET /item_data
  # GET /item_data.json
  def index
    @item_data = ItemData.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @item_data }
    end
  end

  # GET /item_data/1
  # GET /item_data/1.json
  def show
    @item_datum = ItemData.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item_datum }
    end
  end

  # GET /item_data/new
  # GET /item_data/new.json
  def new
    @item_datum = ItemData.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item_datum }
    end
  end

  # GET /item_data/1/edit
  def edit
    @item_datum = ItemData.find(params[:id])
  end

  # POST /item_data
  # POST /item_data.json
  def create
    @item_datum = ItemData.new(params[:item_datum])

    respond_to do |format|
      if @item_datum.save
        format.html { redirect_to @item_datum, notice: 'Item datum was successfully created.' }
        format.json { render json: @item_datum, status: :created, location: @item_datum }
      else
        format.html { render action: "new" }
        format.json { render json: @item_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /item_data/1
  # PUT /item_data/1.json
  def update
    @item_datum = ItemData.find(params[:id])

    respond_to do |format|
      if @item_datum.update_attributes(params[:item_datum])
        format.html { redirect_to @item_datum, notice: 'Item datum was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @item_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_data/1
  # DELETE /item_data/1.json
  def destroy
    @item_datum = ItemData.find(params[:id])
    @item_datum.destroy

    respond_to do |format|
      format.html { redirect_to item_datum_url }
      format.json { head :ok }
    end
  end
end
