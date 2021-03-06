class SpacesController < ApplicationController
before_filter :load_theater

  def index
    @spaces = @theater.spaces.all(:order => "name")
  end
  
  def show
    @space = @theater.spaces.find(params[:id])
  end
  
  def new
    @space = @theater.spaces.new
  end
  
  def create
    @space = @theater.spaces.new(params[:space])
    if @space.save
      flash[:notice] = "Successfully created space."
      redirect_to [@theater, @space]
    else
      render :action => 'new'
    end
  end
  
  def edit
    @space = @theater.spaces.find(params[:id])
  end
  
  def update
    @space = @theater.spaces.find(params[:id])
   if @space.update_attributes(params[:space])
      redirect_to [@theater, @space]
   else
      render :action => 'edit'
    end
  end
  
  def destroy
    @space = @theater.spaces.find(params[:id])
    @space.destroy
    flash[:notice] = "Successfully destroyed space."
    redirect_to theater_spaces_url(@theater)
  end

private
  def load_theater
    @theater = Theater.find(params[:theater_id])
  end
end
