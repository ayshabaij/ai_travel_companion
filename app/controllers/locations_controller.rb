class LocationsController < ApplicationController
  require 'net/http'
  require 'json'

  def index
    hobby = Hobby.find(params[:hobby_id])
    @locations = fetch_locations(hobby.name)
  end

  private

  def fetch_locations(hobby_name)
    uri = URI("http://localhost:5000/locations?hobby=#{URI.encode(hobby_name)}")
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end
end
