class ProductionsController < ApplicationController
  def index
    @productions = Production.find(:all, :include => [:play, :theater], :order => "start_date")
  end
  
  def show
    @production = Production.find(params[:id])
  end
  
  def new
    @theater = Theater.find(params[:theater_id])
    @production = Production.new(:theater_id => params[:theater_id])
  end
  
  def create
    @production = Production.new(params[:production])
    @production.play.characters.each do |c|
      @production.castings.build(:character_id => c.id)
    end
    if @production.save
      flash[:notice] = "Successfully created production."
      redirect_to @production
    else
      render :action => 'new'
    end
  end
  
  def edit
    @production = Production.find(params[:id])
  end
  
  def update
    @production = Production.find(params[:id])
   if @production.update_attributes(params[:production])
      redirect_to @production
   else
      render :action => 'edit'
    end
  end
  
  def destroy
    @production = Production.find(params[:id])
    @production.destroy
    flash[:notice] = "Successfully destroyed production."
    redirect_to productions_url
  end
end
