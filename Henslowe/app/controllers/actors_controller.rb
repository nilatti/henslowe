class ActorsController < UsersController
  # GET /users
  # GET /users.xml
  def index
    @actors = Actor.all
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @actor = Actor.find(params[:id])
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @actor = Actor.new
  end

  # GET /users/1/edit
  def edit
    @actor = Actor.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @actor = Actor.new(params[:actor])
    if @actor.save
      flash[:notice] = 'Registration successful.'
      redirect_to @actor
    else
      render :action => "new"
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @actor = Actor.find(params[:id])

    respond_to do |format|
      if @actor.update_attributes(params[:actor])
        flash[:notice] = 'success!'
        format.html { redirect_to(@actor) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @actor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @actor = Actor.find(params[:id])
    @actor.destroy

    respond_to do |format|
      format.html { redirect_to actors_url }
      format.xml  { head :ok }
    end
  end
end
