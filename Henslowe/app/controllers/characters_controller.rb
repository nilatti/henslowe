class CharactersController < ApplicationController
  before_filter :load_play  

  def index
    @characters = @play.characters.all
  end
  
  def show
    @character = @play.characters.find(params[:id])
  end
  
  def new
    @character = @play.characters.new
  end
  
  def create
    @character = @play.characters.new(params[:character])
    if @character.save
      flash[:notice] = "Successfully created character."
      redirect_to [@play, @character]
    else
      render :action => 'new'
    end
  end
  
  def edit
    @character = @play.characters.find(params[:id])
  end
  
  def update
    @character = @play.characters.find(params[:id])
    if @character.update_attributes(params[:character])
      flash[:notice] = "Successfully updated character."
      redirect_to [@play, @character]
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @character = play.characters.find(params[:id])
    @play = @character.play
    @character.destroy
    flash[:notice] = "Successfully destroyed character."
    redirect_to play_characters_path(@play)
  end

private

    def load_play
      @play = Play.find(params[:play_id])
    end
end
