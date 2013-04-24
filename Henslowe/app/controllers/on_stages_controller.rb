class OnStagesController < ApplicationController
  def index
    @on_stages = OnStage.all
  end
  
  def show
    @on_stage = OnStage.find(params[:id])
  end
  
  def new
    @on_stage = OnStage.new
  end
  
  def create
    @on_stage = OnStage.new(params[:on_stage])
    if @on_stage.save
      flash[:notice] = "Successfully created on stage."
      redirect_to @on_stage
    else
      render :action => 'new'
    end
  end
  
  def edit
    @on_stage = OnStage.find(params[:id])
  end
  
  def update
    @on_stage = OnStage.find(params[:id])
    if @on_stage.update_attributes(params[:on_stage])
      flash[:notice] = "Successfully updated on stage."
      redirect_to @on_stage
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @on_stage = OnStage.find(params[:id])
    @on_stage.destroy
    flash[:notice] = "Successfully destroyed on stage."
    redirect_to on_stages_url
  end
end
