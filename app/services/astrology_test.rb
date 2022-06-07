require_relative 'astrology_api'
require 'json'

userID = ENV["API_UID"]
apiKey = ENV["API_KEY"]

# make some dummy data in order to call vedic rishi api
data = {
    'date'=> 10,
    'month'=> 12,
    'year'=> 1993,
    'hour'=> 1,
    'minute'=> 25,
    'latitude'=> 25,
    'longitude'=> 82,
    'timezone'=> 5.5
}

# api name which is to be called
resource = "astro_details"

# instantiate VedicRishiClient class
ritesh = VRClient.new(userID, apiKey)

# call horoscope apis
responseData = ritesh.call(
  resource,
  data['date'],
  data['month'],
  data['year'],
  data['hour'],
  data['minute'],
  data['latitude'],
  data['longitude'],
  data['timezone']
)

puts responseData
