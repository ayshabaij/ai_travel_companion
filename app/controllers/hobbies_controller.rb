class HobbiesController < ApplicationController
  require 'net/http'
  require 'json'

  def index
    @hobbies = Hobby.all
  end

  def show
    @hobby = Hobby.find(params[:id])
    @locations = fetch_locations(@hobby.name)
  end

  private

  def fetch_locations(hobby_name)
    uri = URI("http://localhost:5000/locations?hobby=#{URI.encode(hobby_name)}")
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end
end
