class PasswordResetsController < ApplicationController
  def new
  end


  def create
    user = User.find_by(email: params[:email])
    user.send_password_reset if user
    flash[:notice] = "Instructions to reset your password have been emailed to you"
    redirect_to root_url
  end

  def edit
    @user = User.find_by_password_reset_token!(params[:id])
  end

  def update
    @user = User.find_by_password_reset_token!(params[:id])
    if @user.password_reset_sent_at < 2.hours.ago
      redirect_to new_password_reset_path, :alert => "Password reset has expired."
    elsif @user.update_attributes(params.require(:user).permit(:password, :password_confirmation))
      redirect_to root_url, :notice => "Password has been reset!"
    else
      render :edit
    end
  end

end
