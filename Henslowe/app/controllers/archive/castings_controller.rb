class CastingsController < ApplicationController
  def index
    @castings = Casting.all
  end
  
  def show
    @casting = Casting.find(params[:id])
  end
  
  def new
    @casting = Casting.new
  end
  
  def create
    @casting = Casting.new(params[:casting])
    job.build(:theater_id => @casting.production.theater_id, :niche_id => 9)
    @casting.job_id = job.id
    if @casting.save
      flash[:notice] = "Successfully created casting."
      redirect_to @casting
    else
      render :action => 'new'
    end
  end
  
  def edit
    @casting = Casting.find(params[:id])
  end
  
  def update
    @casting = Casting.find(params[:id])
    if @casting.update_attributes(params[:casting])
      flash[:notice] = "Successfully updated casting."
      redirect_to @casting
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @casting = Casting.find(params[:id])
    @casting.destroy
    flash[:notice] = "Successfully destroyed casting."
    redirect_to castings_url
  end

  #after_save  do
  #  @casting.job.update_attribute(:user_id, @casting.user_id)
 # end
end
