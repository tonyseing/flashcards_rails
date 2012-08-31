class BundlesController < ApplicationController
  before_filter :authenticate_user!

  # GET /bundles
  # GET /bundles.json
  def index
    @bundles = current_user.bundles.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bundles }
    end
  end

  # GET /bundles/1
  # GET /bundles/1.json
  def show
    @bundle = current_user.bundles.find(params[:id]) || current_user.bundles.find(params[:bundle_id])
    @flashcards = current_user.bundles.find(params[:id]).flashcards
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bundle }
    end
  end

  # GET /bundles/new
  # GET /bundles/new.json
  def new
    @bundle = current_user.bundles.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bundle }
    end
  end

  def use_flash_cards
    @bundle = current_user.bundles.find(params[:id])
    @flashcards = @bundle.flashcards.all

      respond_to do |format|
      format.html # use_flash_cards.html.erb
      format.json { render json: @flashcard }
    end
  end
  
  # GET /bundles/1/edit
  def edit
    @bundle = current_user.bundles.find(params[:id])
  end

  # POST /bundles
  # POST /bundles.json
  def create
    @bundle = current_user.bundles.new(params[:bundle])

    respond_to do |format|
      if @bundle.save
        format.html { redirect_to bundles_url, notice: 'Bundle was successfully created.' }
        format.json { render json: @bundle, status: :created, location: @bundle }
      else
        format.html { render action: "new" }
        format.json { render json: @bundle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bundles/1
  # PUT /bundles/1.json
  def update
    @bundle = current_user.bundles.find(params[:id])

    respond_to do |format|
      if @bundle.update_attributes(params[:bundle])
        format.html { redirect_to @bundle, notice: 'Bundle was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bundle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bundles/1
  # DELETE /bundles/1.json
  def destroy
    @bundle = current_user.bundles.find(params[:id])
    @bundle.destroy

    respond_to do |format|
      format.html { redirect_to bundles_url }
      format.json { head :no_content }
    end
  end
end
