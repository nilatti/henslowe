class PlaysController < ApplicationController
  def index
    @plays = Play.all
  end
  
  def show
    @play = Play.find(params[:id])
  end
  
  def new
    @play = Play.new
  end
  
  def create
    @play = Play.new(params[:play])
    number_of_acts = @play.number_of_acts.to_i
    n = 1
    number_of_acts.times do 
      act = @play.acts.build(:act_number => n)
      1.times {act.scenes.build(:scene_number => 1)}
      n +=1
    end
    if @play.author_first_name && @play.author_last_name
      author = Author.create(:first_name => @play.author_first_name, :last_name => @play.author_last_name)
      @play.author = author
    end
    if @play.save
      flash[:notice] = "Successfully created play."
      redirect_to @play
    else
      render :action => 'new'
    end
  end
  
  def edit
    @play = Play.find(params[:id])
  end
  
  def update
    @play = Play.find(params[:id])
    if @play.update_attributes(params[:play])
      flash[:notice] = "Successfully updated play."
      redirect_to @play
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @play = Play.find(params[:id])
    @play.destroy
    flash[:notice] = "Successfully destroyed play."
    redirect_to plays_url
  end
end
