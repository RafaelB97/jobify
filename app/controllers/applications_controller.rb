class ApplicationsController < ApplicationController
    before_action :authenticate_user!

    def index
    end

    def show
    end

    def new
        @job = Job.find(params[:job_id])
    end

    def edit
        puts "SI FUNCIONA!" 
        @job = Job.find(params[:job_id])
        @application = @job.applications.find(params[:id])
        if current_user != @job.user
            redirect_to job_path(@job)
        end
    end

    def create
        @job = Job.find(params[:job_id])
        @comment = @job.applications.new
        @comment.user = current_user
        @comment.save
        redirect_to job_path(@job)
    end

    def update
        puts "SI FUNCIONA MEJOR"
        @job = Job.find(params[:job_id])
        @application = @job.applications.find(params[:id])
        @application.update(application_params)
        redirect_to @job
    end

    def destroy
        @job = Job.find(params[:job_id])
        @comment = @job.applications.find(params[:id])
        @comment.destroy
        redirect_to job_path(@job)
    end

    private
        def application_params
            params.require(:application).permit(:status, :rateJob)
        end
end
