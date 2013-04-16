class FrenchScenesController < ApplicationController
#  def index
#    @french_scenes = FrenchScene.all
#  end
  
  def show
    @french_scene = FrenchScene.find(params[:id])
  end
  
  def new
    @french_scene = FrenchScene.new
  end
  
  def create
    @french_scene = FrenchScene.new(params[:french_scene])
    if @french_scene.save
      flash[:notice] = "Successfully created french scene."
      redirect_to @french_scene
    else
      render :action => 'new'
    end
  end
  
  def edit
    @french_scene = FrenchScene.find(params[:id])
  end
  
  def update
    @french_scene = FrenchScene.find(params[:id])
    if @french_scene.update_attributes(params[:french_scene])
      flash[:notice] = "Successfully updated french scene."
      redirect_to @french_scene
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @french_scene = FrenchScene.find(params[:id])
    @act = @french_scene.act
    @french_scene.destroy
    flash[:notice] = "Successfully destroyed french scene."
    redirect_to act_path(@act)
  end
end
