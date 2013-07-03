class RehearsalsController < ApplicationController
  before_filter :load_production  

  def index
    @rehearsals = @production.rehearsals.all
  end
  
  def show
    @rehearsal = @production.rehearsals.find(params[:id])
    
  end
  
  def new
    @rehearsal = @production.rehearsals.new
  end
  
  def create
    @rehearsal = @production.rehearsals.new(params[:rehearsal])
    if @rehearsal.save
      flash[:notice] = "Successfully created rehearsal."
      redirect_to [@production, @rehearsal]
    else
      render :action => 'new'
    end
  end
  
  def edit
    @rehearsal = @production.rehearsals.find(params[:id])
  end
  
  def update
    @rehearsal = @production.rehearsals.find(params[:id])
    if @rehearsal.update_attributes(params[:rehearsal])
      flash[:notice] = "Successfully updated rehearsal."
      redirect_to [@production, @rehearsal]
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @rehearsal = production.rehearsals.find(params[:id])
    @production = @rehearsal.production
    @rehearsal.destroy
    flash[:notice] = "Successfully destroyed rehearsal."
    redirect_to production_rehearsals_path(@production)
  end

private

    def load_production
      @production = Production.find(params[:production_id])
    end
end
