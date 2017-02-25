class WelcomeController < ApplicationController
  def home
    # render :layout => false
    @projects = Project.all
  end
end
