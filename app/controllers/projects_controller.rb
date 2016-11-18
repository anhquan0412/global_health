class ProjectsController < ApplicationController
   before_action :set_project, only: [:edit, :update, :show, :like, :destroy]
   
   def index
       @projects= Project.paginate(page: params[:page], per_page: 10)
   end
    
   
   def new
      @project = Project.new
   end
  
   def create
      @project = Project.new(project_params)
      @project.user = User.find(1)
      
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
      if @project.update(project_params)
         flash[:success] = "Your project was updated succesfully!"
         redirect_to project_path(@project) #to SHOW the project based on its id
      else
         render :edit
      end
   end
   
   
   def destroy
      flash[:success] = " \"#{@project.name}\" is deleted successfully"
      Project.find(params[:id]).destroy
      redirect_to projects_path
   end
   
   
   private
      def project_params
         params.require(:project).permit(:name, :start_date, :end_date, :description, :website, :country_id, :picture) 
         #add " array: [] " to whitelist for array in checkbox 
      end
      def set_project
         @project = Project.find(params[:id])
      end
      
end