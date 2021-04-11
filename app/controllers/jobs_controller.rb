class JobsController < ApplicationController
  def index
    if params[:order] == 'zip'
      @jobs = Job.all.order('zip')    
    else
      @jobs = Job.all
    end
  end

  def show
    @job = Job.find params[:id]
    
    @response = helpers.getWeatherApi job: @job 
  end

  def my_method job: 
    Rails.cache.fetch("#{job.id}/competing_price", expires_in: 1.hours) do
      @currentweather = helpers.getWeatherApi job: job
    end
  end

  helper_method :my_method
end
