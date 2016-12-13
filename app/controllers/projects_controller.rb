class ProjectsController < ApplicationController
   before_action :set_project, only: [:edit, :update, :show, :like, :destroy]
   before_action :require_user, except: [:show, :index] #only for new, create 
   #....User has to log in to perform these actions
  #this is defined in application_controller
  
  before_action :require_same_user, only: [:edit, :update]
  
  before_action :admin_user, only: [:destroy]
  
   
   def index
       @projects= Project.paginate(page: params[:page], per_page: 10)
   end
    
   
   def new
      @project = Project.new
   end
  
   def create
      @project = Project.new(project_params)
      
      #initialize like_count
      @project.like_count = 0
      
      @project.user = current_user
      
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
   
   
   def like
      like_record = Like.find_by(user_id: User.first.id, project_id: @project.id)
      
      if like_record.nil? #record not exist in Like table
         Like.create(user: User.first, project: @project)
         @project.like_count = @project.like_count + 1
         @project.save
         
         flash[:success] = "You liked \"#{@project.name}\" "
      else #record already exists. Unlike now = delete like record
         like_record.destroy #this might be bad
         @project.like_count = @project.like_count - 1
         @project.save
         
         flash[:danger] = "You unliked \"#{@project.name}\" "
      end
      
      redirect_to :back 
      #because we have thumbs in index page, we want the user to stay at that current page.
      
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
         params.require(:project).permit(:name, :start_date, :end_date, :description, :website, :country_id, :picture, :document, specialty_ids:[])
         #add " array: [] " to whitelist for array in checkbox 
      end
      def set_project
         @project = Project.find(params[:id])
      end
      
      def require_same_user
         if (@project.user != current_user && !current_user.admin?) #if not project's user and not an admin
           flash[:danger]="You can only edit your own projects"
           redirect_to :back #####
         end
      
         rescue ActionController::RedirectBackError
         redirect_to root_path
      end
end