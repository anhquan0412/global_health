class WelcomeController < ApplicationController
  def home
    # render :layout => false
    @projects = Project.all
    @locations = Location.all
    
  end
end
