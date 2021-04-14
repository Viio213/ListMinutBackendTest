require 'rails_helper'

RSpec.describe JobsHelper, :type => :helper do
    context 'premier test'
    describe "#getWeatherApi" do
        it 'should be ok with zip and coord' do
            job = FactoryGirl.create(:job)
            helper.getWeatherApi job: job

            job = Job.find(job.id)

            expect(job.temp).not_to eq(nil)
            expect(job.tempfeels).not_to eq(nil)
            expect(job.iconurl).not_to eq(nil)
            expect(job.icondescription).not_to eq('Error api call')
        end

        it 'should be ok with zip' do
            job = FactoryGirl.create(:job_no_zip_no_coord)
            helper.getWeatherApi job: job

            job = Job.find(job.id)

            expect(job.temp).not_to eq(nil)
            expect(job.tempfeels).not_to eq(nil)
            expect(job.iconurl).not_to eq(nil)
            expect(job.icondescription).not_to eq('Error api call')
        end

        it 'should be ok with coord' do
            job = FactoryGirl.create(:job_no_zip)
            helper.getWeatherApi job: job

            job = Job.find(job.id)

            expect(job.temp).not_to eq(nil)
            expect(job.tempfeels).not_to eq(nil)
            expect(job.iconurl).not_to eq(nil)
            expect(job.icondescription).not_to eq('Error api call')
        end

        it 'should be get an error with nothing' do
            job = FactoryGirl.create(:job_no_zip_nothing)
            helper.getWeatherApi job: job

            job = Job.find(job.id)

            expect(job.temp).to eq(0)
            expect(job.tempfeels).to eq(0)
            expect(job.iconurl).to eq("")
            expect(job.icondescription).to eq("No data to search")
        end
    end    
end