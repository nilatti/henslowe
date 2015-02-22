class JobsController < ApplicationController
before_filter :load_theater

  def index
    @jobs = @theater.jobs.all
  end
  
  def show
    @job = @theater.jobs.find(params[:id])
  end

  def doubling
    @job = @theater.jobs.find(params[:id])
  end
  
  def new
    @job = @theater.jobs.new
  end
  
  def create
    @job = @theater.jobs.new(params[:job])
    if @job.save
      flash[:notice] = "Successfully created job."
      redirect_to [@theater, @jobs]
    else
      render :action => 'new'
    end
  end
  
  def edit
    @job = @theater.jobs.find(params[:id])
  end
  
  def update
    @job = @theater.jobs.find(params[:id])
   if @job.update_attributes(params[:job])
      redirect_to [@theater, @job]
   else
      render :action => 'edit'
    end
  end
  
  def destroy
    @job = @theater.jobs.find(params[:id])
    @job.destroy
    flash[:notice] = "Successfully destroyed job."
    redirect_to theater_jobs_url(@theater)
  end

private
  def load_theater
    @theater = Theater.find(params[:theater_id])
  end
end