class FlashcardsController < ApplicationController
  # GET /flashcards
  # GET /flashcards.json
  def index
    @bundle = current_user.bundles.find(params[:bundle_id])
    @flashcards = @bundle.flashcards.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @flashcards }
    end
  end

  # GET /flashcards/1
  # GET /flashcards/1.json
  def show
    @bundle = current_user.bundles.find(params[:bundle_id])

    @flashcard = @bundle.flashcards.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @flashcard }
    end
  end

  def get_random_card
    @bundle = current_user.bundles.find(params[:bundle_id])
    @flashcards = @bundle.flashcards.all

    @bundle = current_user.bundles.find(params[:bundle_id])

    @flashcard = @flashcards[rand(@flashcards.length)]

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @flashcard }
    end
    
  end

  # GET /flashcards/new
  # GET /flashcards/new.json
  def new
        @bundle = current_user.bundles.find(params[:bundle_id])

    @flashcard = @bundle.flashcards.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @flashcard }
    end
  end

  # GET /flashcards/1/edit
  def edit
        @bundle = current_user.bundles.find(params[:bundle_id])

    @flashcard = @bundle.flashcards.find(params[:id])
  end

  # POST /flashcards
  # POST /flashcards.json
  def create
    @bundle = current_user.bundles.find(params[:bundle_id])

    @flashcard = @bundle.flashcards.new(params[:flashcard])

    respond_to do |format|
      if @flashcard.save
        format.html { redirect_to bundle_path(@bundle), notice: 'Flashcard was successfully created.' }
        format.json { render json: @flashcard, status: :created, location: @flashcard }
      else
        format.html { render action: "new" }
        format.json { render json: @flashcard.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /flashcards/1
  # PUT /flashcards/1.json
  def update
        @bundle = current_user.bundles.find(params[:bundle_id])

    @flashcard = @bundle.flashcards.find(params[:id])

    respond_to do |format|
      if @flashcard.update_attributes(params[:flashcard])
        format.html { redirect_to bundle_path(@bundle), notice: 'Flashcard was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @flashcard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flashcards/1
  # DELETE /flashcards/1.json
  def destroy
        @bundle = current_user.bundles.find(params[:bundle_id])

    @flashcard = @bundle.flashcards.find(params[:id])
    @flashcard.destroy

    respond_to do |format|
      format.html { redirect_to bundle_path(@bundle) }
      format.json { head :no_content }
    end
  end
end
