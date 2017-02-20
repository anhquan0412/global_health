class SpecialtiesController < ApplicationController
    before_action :require_user
    before_action :admin_user, only: [:new,:create,:edit, :update, :destroy, :index]
    before_action :set_specialty, only: [:edit, :update, :show, :destroy]
    
    def new
        @specialty = Specialty.new
    end
    
    def index
        @specialties = Specialty.all
    end
    
    def create
        @specialty = Specialty.new(specialty_params)
        if @specialty.save
          flash[:success] = "Your specialty has been created successfully"
          redirect_to specialties_path
          
        else
          render :new
        end
    end
  
    def show
     
     @projects = @specialty.projects.paginate(page: params[:page], per_page: 3)
     @users = @specialty.users.paginate(page: params[:page], per_page: 5)
    end
    
    
    def edit
      
      
    
    end
    
    def update
      
      
      if @specialty.update(specialty_params)
        flash[:success] = "Specialty has been edited successfully"
        redirect_to specialties_path
        
      else
        render :edit
      end
      
      
    end
    
    
    def destroy
      flash[:success] = " \"#{@specialty.name}\" is deleted successfully"
      Specialty.find(params[:id]).destroy
      
      redirect_to specialties_path
      
    end
    
    private
        def specialty_params
          params.require(:specialty).permit(:name)
        end
        
        def set_specialty
          @specialty = Specialty.find(params[:id])
        end
    
end
    