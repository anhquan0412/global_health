class UsersController <ApplicationController
   before_action :set_user, only: [:edit, :update, :show] 
#the set_project action has to be placed before require_same_user, 
#so require_same_user can have the instant variable it needs.
   before_action :require_same_user, only: [:edit, :update]
   
    def index
        @users = User.paginate(page: params[:page], per_page: 10)  
    end
    
    
    def new #register
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
          flash[:success] = "Your account has been created successfully"
          session[:user_id] = @user.id #when account is created, user is logged in
          redirect_to recipes_path
        else
          render 'new'
        end
    
    end
  
    def edit
        #do set_chef
    end
  
    def update
        #do set_chef
        if(@user.update(user_params))
          flash[:success] = "Your account has been updated successfully"
          redirect_to user_path(@user)
        else
          render 'edit'
        end
    end
  
    def show
     #do set_chef
        @projects = @user.projects.paginate(page: params[:page], per_page: 5)
    end
    
   private
    def user_params
      params.require(:user).permit(:prefix, :first_name, :last_name, :suffix, :address_type, :address, :city, :zipcode, :email, :phone_work, :phone_mobile, :fax_number, :institution, :status_id, :picture)
    end
      
    def require_same_user
      if @user != current_user
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