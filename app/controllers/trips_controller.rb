require 'net/http'
require 'uri'
require 'json'

class TripsController < ApplicationController
  before_action :authenticate_user!

  def save_start_date
    current_user.update(trip_start_date: params[:trip_start_date])
    if current_user.save
      flash[:success] = "Start date saved successfully"
      redirect_to trip_end_date_path # Redirect to the next step
    else
      flash[:error] = "Failed to save start date"
      render :start_date_form
    end
  end

  def save_end_date
    current_user.update(trip_end_date: params[:trip_end_date])
    if current_user.save
      flash[:success] = "End date saved successfully"
      redirect_to trip_address_path # Redirect to the next step
    else
      flash[:error] = "Failed to save end date"
      render :end_date_form
    end
  end

  def save_address
    current_user.update(trip_address: params[:trip_address])
    if current_user.save
      flash[:success] = "Address saved successfully"
      redirect_to trip_budget_path # Redirect to the next step
    else
      flash[:error] = "Failed to save address"
      render :address_form
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
        redirect_to trip_prompt_path(prompt_id: prompt.id) # Pass the prompt ID to the next action
      else
        flash[:error] = "Failed to generate prompt"
        redirect_to some_error_page_path
      end
    else
      flash[:error] = "Failed to generate prompt"
      redirect_to some_error_page_path
    end
  else
    flash[:error] = "Failed to save budget"
    render :budget_form
  end
end


  def show_prompt
  @prompt = current_user.prompts.find(params[:prompt_id]).content
end
end
