class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def setup
    # This action should render the form to input date of birth
  end

  def update_setup
    if current_user.update(date_of_birth: params[:dob])
      redirect_to setup_hobbies_profile_path
    else
      render :setup
    end
  end

  def setup_hobbies
    @hobbies = Hobby.all
    # This action should render the form to select hobbies
  end

  def update_hobbies
    puts "------ hobby"
    puts params
    puts "----------"
    current_user.hobbies = Hobby.where(name: params[:hobby_names])
    redirect_to setup_dietary_restrictions_profile_path
  end

  def setup_dietary_restrictions
    @dietary_restrictions = DietaryRestriction.all
    # This action should render the form to select dietary restrictions
  end

  def update_dietary_restrictions
    puts "------ DR"
    puts params
    puts "----------"
    current_user.dietary_restrictions = DietaryRestriction.where(name: params[:dietary_restriction_ids])
    redirect_to setup_accessibility_profile_path
  end

  def setup_accessibility
    @accessibilities = Accessibility.all
    # This action should render the form to select accessibility needs
  end

  def update_accessibility
    puts "------ AI"
    puts params
    puts "----------"
    current_user.accessibilities = Accessibility.where(name: params[:accessibility_ids])
    redirect_to welcome_index_path
  end
end
