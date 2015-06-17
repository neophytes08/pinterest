class ProfileController < ApplicationController
  before_action :check_user_profile, only: :index

  def index
    @user_infos = User.find(current_user)
  end

  def new
    @user_infos = UserInfo.new
  end

  def create

    puts @user_infos
    redirect_to @user_infos
    # @profile = current_user.user_info.build

    # if @profile.save
    #   redirect_to profile
    # else
    #   render 'new'
    # end
  end

  private
  def profile_params
    params.require(:user_infos).permit(:fname, :lname, :bday, :address, :picture)
  end

  private

   def check_user_profile
    user = User.find(current_user.id)

    if !user.user_info
      render 'new'
    end

  end

end
