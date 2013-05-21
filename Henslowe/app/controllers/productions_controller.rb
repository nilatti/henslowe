class ProductionsController < ApplicationController
before_filter :load_theater

  def index
    @productions = @theater.productions.all(:order => "start_date")
  end
  
  def show
    @production = @theater.productions.find(params[:id])
  end

  def doubling
    @production = @theater.productions.find(params[:id])
  end
  
  def new
    @production = @theater.productions.new
  end
  
  def create
    @production = @theater.productions.new(params[:production])
    @production.play.characters.each do |c|
      @production.castings.build(:character_id => c.id)
    end
    if @production.save
      flash[:notice] = "Successfully created production."
      redirect_to [@theater, @production]
    else
      render :action => 'new'
    end
  end
  
  def edit
    @production = @theater.productions.find(params[:id])
  end
  
  def update
    @production = @theater.productions.find(params[:id])
   if @production.update_attributes(params[:production])
      redirect_to [@theater, @production]
   else
      render :action => 'edit'
    end
  end
  
  def destroy
    @production = @theater.productions.find(params[:id])
    @production.destroy
    flash[:notice] = "Successfully destroyed production."
    redirect_to theater_productions_url(@theater)
  end

private
  def load_theater
    @theater = Theater.find(params[:theater_id])
  end
end
