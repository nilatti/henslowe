class TheatersController < ApplicationController
  def index
    @theaters = Theater.all
  end
  
  def show
    @theater = Theater.find(params[:id])
  end
  
  def new
    @theater = Theater.new
  end
  
  def create
    @theater = Theater.new(params[:theater])
    if @theater.save
      flash[:notice] = "Successfully created theater."
      redirect_to @theater
    else
      render :action => 'new'
    end
  end
  
  def edit
    @theater = Theater.find(params[:id])
  end
  
  def update
    @theater = Theater.find(params[:id])
    if @theater.update_attributes(params[:theater])
      flash[:notice] = "Successfully updated theater."
      redirect_to @theater
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @theater = Theater.find(params[:id])
    @theater.destroy
    flash[:notice] = "Successfully destroyed theater."
    redirect_to theaters_url
  end
end
