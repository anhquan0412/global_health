class SearchController < ApplicationController
    def index
        
       
        
        
    end
    
    def user
        @search = User.search(params[:q])
        
        @answers = @search.result.paginate(page: params[:page], per_page: 8)
    end
    
    def project
         @search = Project.search(params[:q])
        
        @answers = @search.result.paginate(page: params[:page], per_page: 5)
    end

end