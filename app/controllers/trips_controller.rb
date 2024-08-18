require 'net/http'
require 'uri'
require 'json'

class TripsController < ApplicationController
  before_action :authenticate_user!

  def save_start_date
    current_user.update(trip_start_date: params[:trip_start_date])
    if current_user.save
      flash[:success] = "Start date saved successfully"
      redirect_to trip_end_date_path
    else
      flash[:error] = "Failed to save start date"
      render :start_date_form
    end
  end

  def save_end_date
    current_user.update(trip_end_date: params[:trip_end_date])
    if current_user.save
      flash[:success] = "End date saved successfully"
      redirect_to trip_address_path
    else
      flash[:error] = "Failed to save end date"
      render :end_date_form
    end
  end

  def save_address
    if validate_korean_address(params[:trip_address])
      current_user.update(trip_address: params[:trip_address])
      if current_user.save
        flash[:success] = "Address saved successfully"
        redirect_to trip_budget_path
      else
        flash[:error] = "Failed to save address"
        render :address_form
      end
    else
      flash[:error] = "Please enter a location within South Korea"
      redirect_to invalid_location_path
    end
  end

  def save_budget
    current_user.update(trip_budget: params[:trip_budget])

    if current_user.save
      uri = URI.parse("http://localhost:4568/receive_trip_data")
      request = Net::HTTP::Post.new(uri)
      request.content_type = "application/json"

      request.body = {
        user_id: current_user.id,
        start_date: current_user.trip_start_date,
        end_date: current_user.trip_end_date,
        address: current_user.trip_address,
        budget: current_user.trip_budget
      }.to_json

      response = Net::HTTP.start(uri.hostname, uri.port) do |http|
        http.request(request)
      end

      if response.code == "200"
        prompt_content = JSON.parse(response.body)["prompt"]

        if prompt_content.present?
          prompt = current_user.prompts.create(content: prompt_content)
          redirect_to trip_prompt_path(prompt_id: prompt.id)
        else
          flash[:error] = "Failed to generate prompt"
          redirect_to error_page_path
        end
      else
        flash[:error] = "Failed to generate prompt"
        redirect_to error_page_path
      end
    else
      flash[:error] = "Failed to save budget"
      render :budget_form
    end
  end

  def show_prompt
    @prompt = current_user.prompts.find(params[:prompt_id]).content
  end

  def invalid_location
    # This will render the invalid location page with the error message
  end

  def error_page
    # This will render the error page for other errors
  end

  private

  def validate_korean_address(address)
    api_key = 'AIzaSyAbuiEydNDprEdZYceftCThgasF8M6txOE'
    geocode_url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{CGI.escape(address)}&key=#{api_key}"

    uri = URI.parse(geocode_url)
    response = Net::HTTP.get_response(uri)
    geocode_data = JSON.parse(response.body)

    if geocode_data['status'] == 'OK'
      results = geocode_data['results']
      results.any? { |result| result['formatted_address'].include?('South Korea') }
    else
      false
    end
  end
end
