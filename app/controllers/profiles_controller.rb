class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to profile_path, notice: 'Profile updated successfully.'
    else
      render :edit
    end
  end

  def setup
    @user = current_user
    @hobbies = Hobby.all
  end

  def update_setup
    @user = current_user
    if @user.update(setup_params)
      redirect_to authenticated_root_path, notice: 'Profile setup completed successfully.'
    else
      @hobbies = Hobby.all
      render :setup
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :date_of_birth, :dietary_restrictions, :accessibility_issues)
  end

  def setup_params
    params.require(:user).permit(:date_of_birth, :hobby_ids, :dietary_restrictions, :accessibility_issues)
  end
end
