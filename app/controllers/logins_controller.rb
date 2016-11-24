# this is not a model-backed controller like recipes or chefs.
# there will be no model or database related to this controller


class LoginsController < ApplicationController
  def new
    
  end
  
  def create
    user = User.find_by(email: params[:email]) #no instance variable
    if user && user.authenticate(params[:password])# if this chef exists in our database, and the passwords match
    
      #save chef_id in cookie HERE
      session[:user_id] = user.id #take the chef.id and store it in our browser session COOKIE
      flash[:success] = "You are logged in"
      redirect_to projects_path
    else
      flash[:danger] = "Your email or password does not match" #using flash.now if you will render something later
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:success] = "You have logged out" #use flash if you redirect_to some path
    redirect_to root_path
  end
end