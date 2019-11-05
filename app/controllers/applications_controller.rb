class ApplicationsController < ApplicationController
    def edit
        puts "SI FUNCIONA!"
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
    end

    def destroy
        @job = Job.fin(params[:job_id])
        @comment = @job.applications.find(params[:id])
        redirect_to job_path(@job)
    end
end
