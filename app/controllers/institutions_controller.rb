class InstitutionsController < ApplicationController
    
    before_action :admin_user, only: [:new,:create,:edit, :update, :destroy]
    before_action :set_institution, except: [:new,:create]
    
    def new
        @institution = Institution.new
    end
    
    
    
    def create
        @institution = Institution.new(institution_params)
        if @institution.save
          flash[:success] = "New institution has been created successfully"
          redirect_to users_path
          
        else
          render :new
        end
    end
  
  def show
   
   @users = @institution.users.paginate(page: params[:page], per_page: 3)
  end
  
  
  def edit
    
    
  
  end
  
  def update
    
    
    if @institution.update(institution_params)
      flash[:success] = "Institution has been edited successfully"
      redirect_to users_path
      
    else
      render :edit
    end
    
    
  end
  
  
  def destroy
    flash[:success] = " \"#{@institution.name}\" is deleted successfully"
    Institution.find(params[:id]).destroy
    
    redirect_to users_path
    
  end
  
  private
      def institution_params
        params.require(:institution).permit(:name)
      end
      
      def set_institution
        @institution = Institution.find(params[:id])
      end
    
end
    