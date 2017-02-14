class UsersController <ApplicationController
   before_action :set_user, only: [:edit, :update, :show, :approve] 
#the set_project action has to be placed before require_same_user, 
#so require_same_user can have the instant variable it needs.
   before_action :require_same_user, only: [:edit, :update]
    
    def index
        @users = []
        User.all.each do |i|
            if i.approved?
                @users.push(i)
            end
        end 
        @users = @users.paginate(page: params[:page], per_page: 10)
    end
    
    def pending
        if(current_user.admin?)
            @users = []
            User.all.each do |i|
                if !i.approved?
                    @users.push(i)
                end
            end
        else
            flash[:danger] = "Invalid Request"
            redirect_to root_path
        end
    end
    
    def approve
        if(current_user.admin?)
            # add institution_other to institution table
            @institution = Institution.create(name: @user.institution_other)
            @user.institution_other = nil #reset this field
            
            #create an entry in user-institutions table
            UserInstitution.create(user: @user, institution: @institution)
            
            @user.approved = true
            @user.save
            flash[:success] = "User has been approved"
            redirect_to user_path(@user)
        else
            flash[:danger] = "Invalid Request"
            redirect_to root_path
        end
    end
    
    def new #register
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if verify_recaptcha(model: @user) && @user.save
          flash[:success] = "Your account has been created successfully"
          session[:user_id] = @user.id #when account is created, user is logged in
          redirect_to projects_path
        else
          render 'new'
        end
    
    end
  
    def edit

    end
  
    def update

        if verify_recaptcha(model: @user) && @user.update(user_params)
          flash[:success] = "Your account has been updated successfully"
          redirect_to user_path(@user)
        else
          render 'edit'
        end
    end
  
    def show
        #set_user
        @projects = @user.projects.paginate(page: params[:page], per_page: 5)
        if(@user.approved? || logged_in? && (@user == current_user || current_user.admin?))
            
        else
           flash[:danger] = "Invalid request"
            redirect_to users_path
        end
    end
    
   private
    def user_params
      params.require(:user).permit(:prefix, :first_name, :last_name, 
                                    :suffix, :address_type, :address, 
                                    :city, :zipcode, :state, :email, 
                                    :phone_work, :phone_mobile, :fax_number, 
                                    :status_id, :picture, :country_id, 
                                    :password, :status_other, :institution_other,
                                    specialty_ids:[], institution_ids:[])
    end
      
    def require_same_user
      if ( @user != current_user  && !current_user.admin?)
        flash[:danger] = "You can only edit your own profile"
        redirect_to :back #####
      end
      
      #if there is no back
      rescue ActionController::RedirectBackError
      redirect_to root_path
    end
    
    def set_user
       @user = User.find(params[:id])
    end
    

end