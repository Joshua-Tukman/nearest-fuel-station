class SearchController < ApplicationController
  def index
    location = params[:location]
    conn = Faraday.new("https://developer.nrel.gov") 
  
    response = conn.get("/api/alt-fuel-stations/v1/nearest.json?location=#{location}&api_key=#{ENV["NREL_KEY"]}")
    
    stations = JSON.parse(response.body, symbolize_names: true)
    station_lat = stations[:fuel_stations].first[:latitude]
    station_long = stations[:fuel_stations].first[:longitude]
    fuel_type = stations[:fuel_stations].first[:fuel_type_code]

    geo_conn = Faraday.new("http://www.mapquestapi.com")
    geo_response = geo_conn.get("/geocoding/v1/reverse?key=#{ENV["GEO_KEY"]}&location=#{station_lat},#{station_long}8&includeRoadMetadata=true&includeNearestIntersection=true.json")
    station_info = JSON.parse(geo_response.body, symbolize_names: true)
    @station = Station.new(station_info, fuel_type)
    binding.pry
  end

end