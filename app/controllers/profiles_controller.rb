class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def setup
    # This action should render the form to input date of birth
  end

  def update_setup
    # Process the date of birth and redirect to setup_hobbies
    if current_user.update(date_of_birth: params[:date_of_birth])
      puts "---- DOB is -----"
      puts params
      puts "---------"
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
    current_user.hobbies = Hobby.where(id: params[:hobby_ids])
    puts "---- hobby is -----"
    puts params
    puts "---------"
    redirect_to setup_dietary_restrictions_profile_path
  end

  def setup_dietary_restrictions
    @dietary_restrictions = DietaryRestriction.all
    # This action should render the form to select dietary restrictions
  end

  def update_dietary_restrictions
    current_user.dietary_restrictions = DietaryRestriction.where(id: params[:dietary_restriction_ids])
    puts "---- dietary_restrictions is -----"
    puts params
    puts "---------"
    redirect_to setup_accessibility_profile_path
  end

  def setup_accessibility
    @accessibilities = Accessibility.all
    # This action should render the form to select accessibility needs
  end

  def update_accessibility
    current_user.accessibilities = Accessibility.where(id: params[:accessibility_ids])
    uts "---- accessibilities is -----"
    puts params
    puts "---------"
    redirect_to welcome_index_path
  end
end
