class ActsController < ApplicationController
#  def index
#    @acts = Act.all
#  end
  
  def show
    @act = Act.find(params[:id])
  end
  
  def new
    @act = Act.new
  end
  
  def create
    @act = Act.new(params[:act])
    if @act.save
      flash[:notice] = "Successfully created act."
      redirect_to @act
    else
      render :action => 'new'
    end
  end
  
  def edit
    @act = Act.find(params[:id])
  end
  
  def update
    @act = Act.find(params[:id])
    if @act.update_attributes(params[:act])
      flash[:notice] = "Successfully updated act."
      redirect_to @act
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @act = Act.find(params[:id])
    @act.destroy
    flash[:notice] = "Successfully destroyed act."
    redirect_to acts_url
  end
end
