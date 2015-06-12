class ProfileController < ApplicationController
  before_action :check_user_profile, only: :profile

  def profile
    @user = User.find(current_user)
  end

  def new
   
  end

  def create
    @profile = current_user.profile.build

    if @profile.save
      redirect_to profile
    else
      render 'new'
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:fname, :lname, :bday, :address, :picture)
  end

  #def find_pin
    #@pin = Pin.find(current_user)
  #end 

  private

   def check_user_profile
    user = User.find(current_user.id)

    if !user.user_info
      @profile = UserInfo.new
      render :new
    end

  end

end
