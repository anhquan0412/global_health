class SearchController < ApplicationController
    def index
        
       
        
        
    end
    
    # def user
    #     @search = User.search(params[:q])
        
    #     @answers = @search.result.paginate(page: params[:page], per_page: 8)
    # end
    
    def user_advanced
        @search = user_ransack_params
        # @search.build_grouping unless @search.groupings.any?
        @users  = ransack_result.includes(:user_institutions).paginate(page: params[:page], per_page: 8)
    end
    
    def project
         @search = Project.search(params[:q])
        
        @answers = @search.result.paginate(page: params[:page], per_page: 5)
    end
    
    
    private
        def user_ransack_params
          User.ransack(params[:q])
        end
    
        def ransack_result
          @search.result(distinct: true)
        end
end