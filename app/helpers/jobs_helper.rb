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
            #@url = 'http://pro.openweathermap.org/data/2.5/forecast/hourly?zip=' + zipcode +',be&appid=43bb4fa1cc59a75e17fb98efe3b4434e'
            @url = 'https://api.weatherbit.io/v2.0/current?&postal_code=' + zipcode + '&country=BE&key='+'f7120113262d41e49dd2445d132d08a1'+'&include=minutely'
        else            
            #@url ='http://pro.openweathermap.org/data/2.5/forecast/hourly?lat=' + lat +'&lon=' + lon + '&appid=43bb4fa1cc59a75e17fb98efe3b4434e'
            @url = 'https://api.weatherbit.io/v2.0/current?&lat=' + lat +'&lon=' + lon + '&key=' + 'f7120113262d41e49dd2445d132d08a1' + '&include=minutely'
        end

        @uri = URI(@url)
    
        @response = Net::HTTP.get @uri
        @output = JSON.parse @response
    
        if !@output || @output.empty? || @output['count'] == 0
            temp = 0
            tempfeels = 0
            iconurl = ''
            icondescription = "Error api call"
        else
            temp = @output['data'][0]['temp']
            tempfeels= @output['data'][0]['app_temp']
            iconurl='https://www.weatherbit.io/static/img/icons/' + @output['data'][0]['weather']['icon'] + '.png'
            icondescription= @output['data'][0]['weather']['description']
        end
        
        job.temp = temp
        job.tempfeels= tempfeels
        job.iconurl=iconurl
        job.icondescription= icondescription
        job.save
    end
end
