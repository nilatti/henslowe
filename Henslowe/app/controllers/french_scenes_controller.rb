class FrenchScenesController < ApplicationController
  before_filter :load_scene
 
  def index
    @french_scenes = @scene.french_scenes.all
  end
  
  def show
    @french_scene = @scene.french_scenes.find(params[:id])
  end
  
  def new
    @french_scene = @scene.french_scenes.new
  end
  
  def create
    @french_scene = @scene.french_scenes.new(params[:french_scene])
    if @french_scene.save
      flash[:notice] = "Successfully created french scene."
      redirect_to [@scene, @french_scene]
    else
      render :action => 'new'
    end
  end
  
  def edit
    @french_scene = @scene.french_scenes.find(params[:id])
  end
  
  def update
    @french_scene = @scene.french_scenes.find(params[:id])
    if @french_scene.update_attributes(params[:french_scene])
      flash[:notice] = "Successfully updated french scene."
      redirect_to [@scene, @french_scene]
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @french_scene = @scene.french_scenes.find(params[:id])
    @act = @french_scene.act
    @french_scene.destroy
    flash[:notice] = "Successfully destroyed french scene."
    redirect_to act_path(@act)
  end

  private
  def load_play
    @play = Play.find(params[:play_id])
  end

  def load_act
    @act = Act.find(params[:act_id])
  end

  def load_scene
    @scene = Scene.find(params[:scene_id])
  end
 
end
