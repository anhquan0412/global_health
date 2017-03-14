class ProjectsController < ApplicationController
   before_action :set_project, only: [:edit, :update, :show, :like, :destroy, :approve]
   before_action :require_user, except: [:show, :index]


  before_action :require_same_user, only: [:edit, :update]

  before_action :admin_user, only: [:destroy]


   def index
     @projects = Project.paginate(page: params[:page], per_page: 5)

   end



   def pending
        if(current_user.admin?)
            @projects = []
            Project.all.each do |i|
                if !i.approved?
                    @projects.push(i)
                end
            end
            @projects = @projects.paginate(page: params[:page], per_page: 5)
        else
            flash[:danger] = "Invalid Request"
            redirect_to root_path
        end
   end

   def approve
        if(current_user.admin?)
            @project.approved = true
            @project.save
            flash[:success] = "Project has been approved"
            redirect_to project_path(@project)
        else
            flash[:danger] = "Invalid Request"
            redirect_to root_path
        end
   end


   def new
      @project = Project.new
   end

   def create
      @project = Project.new(project_params)

      #initialize like_count
      @project.like_count = 0

      @project.user = current_user

      if verify_recaptcha(model: @project) && @project.save
         flash[:success] = "Your project was created successfully!" #this message is defined in _message.html.erb
         redirect_to user_path(current_user) # REDIRECT_TO IS USED TO DIRECT TO A PATH/URL LINK
       #let's NOT use render here....

      else
         render :new #or render 'new'. RENDER IS USED TO DIRECT TO A HTML VIEW
         #redirect_to new_project_path #use redirect_to will wipe out all your input
      end
   end




   def show

         @this_user = @project.user
       if(@project.approved? || @this_user == current_user || current_user.admin?)

       else
           flash[:danger] = "Invalid request"
            redirect_to projects_path
       end

   end

   def edit

   end


   def like
      like_record = Like.find_by(user_id: current_user.id, project_id: @project.id)

      if like_record.nil? #record not exist in Like table
         Like.create(user: current_user, project: @project)
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
      if verify_recaptcha(model: @project) && @project.update(project_params)
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
         params.require(:project).permit(:name, :start_date, :end_date, :description, :website, :picture, :document, :contact_email, :contact_phone,:frequency, :latitude, :longitude, specialty_ids:[], country_ids:[])
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
