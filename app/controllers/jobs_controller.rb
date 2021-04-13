class JobsController < ApplicationController
  def index
    if params[:order] == 'filter'
      @jobs = Job.all.order('temp DESC')
    else
      @jobs = Job.all
    end

    @jobs.each do |job|
      Rails.cache.fetch("#{job.id}/apirequest", expires_in: 1.hours) do
        helpers.getWeatherApi job: job
      end
    end
  end

  def show
    @job = Job.find params[:id]
  end
end
