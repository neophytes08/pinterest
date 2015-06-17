class UserInfosController < ApplicationController
  before_action :check_user_profile, only: :index

  def index
    @user = User.find(current_user.id)
  end

  def new
    @user_info = current_user.build_user_info
  end

  def show
    @user = User.find(current_user)
  end

  def create
    @user_info = current_user.build_user_info(profile_params)

    if @user_info.save
      redirect_to user_infos_path
    else
      render new_user_info_path
    end
  end

  def settings
   @user_info = current_user.user_info
  end

  def update
    @user_info = UserInfo.find(params[:id])
      if @user_info.update(profile_params)
        redirect_to user_infos_path
      else
        redirect_to settings_user_infos_path
      end
  end

  private
  def profile_params
    params.require(:user_info).permit(:fname, :lname, :bday, :address, :picture)
  end

  def check_user_profile
    user = User.find(current_user)

    if !user.user_info
      redirect_to new_user_info_path
  end

  end
end
