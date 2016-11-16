class ProjectsController < ApplicationController
   before_action :set_project, only: [:edit, :update, :show, :like, :destroy]
   
   def index
       @projects= Project.all
   end
    
   
   def new
      @project = Project.new
   end
  
   def create
     @project = Project.new(project_params)
     if @project.save
        flash[:success] = "Your project was created successfully!" #this message is defined in _message.html.erb
         redirect_to projects_path # REDIRECT_TO IS USED TO DIRECT TO A PATH/URL LINK
      #let's NOT use render here....
      
      else
         render :new #or render 'new'. RENDER IS USED TO DIRECT TO A HTML VIEW
         #redirect_to new_project_path #use redirect_to will wipe out all your input
      end
   end
   
   
   
  
   def show
       @this_user = @project.user
   end
    
   def edit
   
   end
   
   def update
   
   end
   
   
   def destroy
      
   end
   
   
   private
      def set_project
         @project = Project.find(params[:id])
      end
      
end