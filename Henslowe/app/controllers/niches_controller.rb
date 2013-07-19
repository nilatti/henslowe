class NichesController < ApplicationController
  # GET /niches
  # GET /niches.json
  def index
    @niches = Niche.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @niches }
    end
  end

  # GET /niches/1
  # GET /niches/1.json
  def show
    @niche = Niche.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @niche }
    end
  end

  # GET /niches/new
  # GET /niches/new.json
  def new
    @niche = Niche.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @niche }
    end
  end

  # GET /niches/1/edit
  def edit
    @niche = Niche.find(params[:id])
  end

  # POST /niches
  # POST /niches.json
  def create
    @niche = Niche.new(params[:niche])

    respond_to do |format|
      if @niche.save
        format.html { redirect_to @niche, notice: 'Niche was successfully created.' }
        format.json { render json: @niche, status: :created, location: @niche }
      else
        format.html { render action: "new" }
        format.json { render json: @niche.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /niches/1
  # PUT /niches/1.json
  def update
    @niche = Niche.find(params[:id])

    respond_to do |format|
      if @niche.update_attributes(params[:niche])
        format.html { redirect_to @niche, notice: 'Niche was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @niche.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /niches/1
  # DELETE /niches/1.json
  def destroy
    @niche = Niche.find(params[:id])
    @niche.destroy

    respond_to do |format|
      format.html { redirect_to niches_url }
      format.json { head :no_content }
    end
  end
end
