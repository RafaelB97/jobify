class JobsController < ApplicationController
    
    def new
    end

    def create
        render plain: params[:job].inspect
    end
end
