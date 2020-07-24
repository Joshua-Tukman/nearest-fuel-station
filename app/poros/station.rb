class Station 
  attr_reader :name, :address, :city, :state, :access_times, :fuel
  def initialize(station_info, fuel_type)
    @name = station_info[:location][:name]
    @address= station_info[:address]
    @city = station_info[:city]
    @state = station_info[:state]
    @access_times = station_info[:access_times]
    @fuel = fuel_type
  end 
end