class ScenesController < ApplicationController
  def index
    @scenes = Scene.all
  end
  
  def show
    @scene = Scene.find(params[:id])
  end
  
  def new
    @scene = Scene.new
  end
  
  def create
    @scene = Scene.new(params[:scene])
    if @scene.save
      flash[:notice] = "Successfully created scene."
      redirect_to @scene
    else
      render :action => 'new'
    end
  end
  
  def edit
    @scene = Scene.find(params[:id])
  end
  
  def update
    @scene = Scene.find(params[:id])
    if @scene.update_attributes(params[:scene])
      flash[:notice] = "Successfully updated scene."
      redirect_to @scene
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @scene = Scene.find(params[:id])
    @act = @scene.act
    @scene.destroy
    flash[:notice] = "Successfully destroyed scene."
    redirect_to act_path(@act)
  end
end
