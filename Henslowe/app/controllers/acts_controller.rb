class ActsController < ApplicationController
  before_filter :load_play

  def index
    @acts = @play.acts.all
  end

  def show
    @act = @play.acts.find(params[:id])
  end
  
  def new
    @act = @play.acts.new
  end
  
  def create
    @act = @play.acts.new(params[:act])
    if @act.save
      flash[:notice] = "Successfully created act."
      redirect_to [@play, @act]
    else
      render :action => 'new'
    end
  end
  
  def edit
    @act = @play.acts.find(params[:id])
  end
  
  def update
    @act = @play.acts.find(params[:id])
    if @act.update_attributes(params[:act])
      flash[:notice] = "Successfully updated act."
      redirect_to [@play, @act]
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @act = @play.acts.find(params[:id])
    @act.destroy
    flash[:notice] = "Successfully destroyed act."
    redirect_to play_acts_path(@play)
  end

  private
  
    def load_play
      @play = Play.find(params[:play_id])
    end
end
