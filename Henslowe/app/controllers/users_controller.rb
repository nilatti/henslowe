class UsersController < ApplicationController
#  filter_access_to :all, :attribute_check => true
  # GET /users
  # GET /users.xml
  def user_params
   params.require(:user).permit(:first_name, :last_name, :name, :date_of_birth, :date_of_hire, :is_female, :email, :calendar, jobs_attributes: [:id, :_destroy])
  end
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])   
  
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = 'Registration successful.'
      redirect_to @user
    else
      render :action => "new"
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])


    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = 'success!'
        format.html { redirect_to(@user) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.xml  { head :ok }
    end
  end
end
