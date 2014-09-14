class AdminController < ApplicationController
  before_action :authenticate_user!, :verify_admin

  def index
    @surveys = Survey.all
    @users = User.all
  end

  def invite
    @user = User.invite!(:email => user_params[:email])
    redirect_to admin_index_path, notice: "Invitation emailed to #{@user.email}"
  end

  private

  def user_params
    params.require(:user).permit(:email, :name)
  end

  def verify_admin
    redirect_to root_path, notice: "You can't be here" unless current_user.admin.eql?(true)
  end
end
