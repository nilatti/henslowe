class FrenchScenesController < ApplicationController
  # GET /french_scenes
  # GET /french_scenes.json
  def index
    @french_scenes = FrenchScene.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @french_scenes }
    end
  end

  # GET /french_scenes/1
  # GET /french_scenes/1.json
  def show
    @french_scene = FrenchScene.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @french_scene }
    end
  end

  # GET /french_scenes/new
  # GET /french_scenes/new.json
  def new
    @french_scene = FrenchScene.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @french_scene }
    end
  end

  # GET /french_scenes/1/edit
  def edit
    @french_scene = FrenchScene.find(params[:id])
  end

  # POST /french_scenes
  # POST /french_scenes.json
  def create
    @french_scene = FrenchScene.new(params[:french_scene])

    respond_to do |format|
      if @french_scene.save
        format.html { redirect_to @french_scene, notice: 'French scene was successfully created.' }
        format.json { render json: @french_scene, status: :created, location: @french_scene }
      else
        format.html { render action: "new" }
        format.json { render json: @french_scene.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /french_scenes/1
  # PUT /french_scenes/1.json
  def update
    @french_scene = FrenchScene.find(params[:id])

    respond_to do |format|
      if @french_scene.update_attributes(params[:french_scene])
        format.html { redirect_to @french_scene, notice: 'French scene was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @french_scene.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /french_scenes/1
  # DELETE /french_scenes/1.json
  def destroy
    @french_scene = FrenchScene.find(params[:id])
    @french_scene.destroy

    respond_to do |format|
      format.html { redirect_to french_scenes_url }
      format.json { head :no_content }
    end
  end
end
