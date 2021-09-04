class JobsController < ApplicationController
  before_action :authenticate_user! , except: [:sample_jobs]
  
  def index 
    jobs = current_user.jobs 
    render json: jobs, include: ['status']
  
  end


  def sample_jobs
  
    jobs = Job.where("is_private <> 'true'").limit(2)
    render json: jobs, include: ['status']
  
  end


  def create 
    job = current_user.jobs.new(job_params)
    
    if job.save 
      render json: job, include: ['status']
    else
      render job.errors.full_messages
    end

  end

  def update
    job = Job.find(params[:id])
    if job.update(job_params)
      render json: job, include: ['status']
    else
      render job.errors.full_messages
    end
  end

  def destroy
    job = Job.find(params[:id])

    if job.destroy 
      puts "job destroyed"
      head 204
    else
      puts job.errors.full_messages
      head 404
    end

  end


  private
  
  def job_params 
    params.require(:job).permit(:title,:city,:state,:url,:description,:confidence_level,:salary,:is_remote,:notes,:is_private,:company)
  end


end
