class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find params[:id]
    
    @response = helpers.getWeatherApi job: @job 
  end
end
