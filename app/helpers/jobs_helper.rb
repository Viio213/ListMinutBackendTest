module JobsHelper
    require 'net/http'
    require 'json'
  
    def getWeatherApi job:
        if !job.zip || job.zip == 0
            usezipcode = false
            lat = job.latitude.to_s
            lon = job.longitude.to_s
        else
            zipcode = job.zip.to_s
            usezipcode = true
        end

        if usezipcode
            @url = 'http://pro.openweathermap.org/data/2.5/forecast/hourly?zip=' + zipcode +',be&appid=43bb4fa1cc59a75e17fb98efe3b4434e'
        else
            @url ='http://pro.openweathermap.org/data/2.5/forecast/hourly?lat=' + lat +'&lon=' + lon + '&appid=43bb4fa1cc59a75e17fb98efe3b4434e'
        end

        @uri = URI(@url)
    
        @response = Net::HTTP.get @uri
        @output = JSON.parse @response
    
        if @output.empty?
            @final_output = 'Error'
        elsif !@output
            @final_output = 'Error'
        else
            #@final_output = @output[0]['label']
        end
  
      return @url
    end
end
