require 'rails_helper'

RSpec.describe Station, type: :model do
  it "can create a station with all the correct info" do 
    station_info = {name: "Seventeenth Street Plaza",
    address: "1737 Lawrence St",
    city: "Denver",
    state: "CO",
    access_times:"MO: Not Specified; TU: Not Specified; WE: Not Specified; TH: Not Specified; FR: Not Specified; SA: Not Specified; SU: Not Specified"}

    fuel_type = "ELEC"

    station = Station.new(station_info, fuel_type)

    binding.pry
  end 
end 