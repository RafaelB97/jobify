class ApplicationsController < ApplicationController
=begin
    If the user want to acces to any view from the application, he has to be sing in.
=end
    before_action :authenticate_user!

=begin 
    The index view and show view are empty so the functions are empty to
=end
    def index
    end

    def show
    end

=begin 
    As te new function from Jobs controller, this is the function from the view new.
=end
    def new
        @job = Job.find(params[:job_id])
    end

=begin 
    This function only works from the owner of the job, this function allows the owner to accept the
    current application that he is seeing from there current job.
=end
    def edit
        puts "SI FUNCIONA!" 
        @job = Job.find(params[:job_id])
        @application = @job.applications.find(params[:id])
        if current_user != @job.user
            redirect_to job_path(@job)
        end
    end

=begin 
    As the create function from Jobs, this function allows the user to create an application from the current job that 
    he is seeing, in this case, we have an associations job has many applications and applications belong to jobs,
    this means we create an applcations from the current job.
=end
    def create
        @job = Job.find(params[:job_id])
        @comment = @job.applications.new
        @comment.user = current_user
        @comment.save
        redirect_to job_path(@job)
    end

=begin 
    This function is called by the edit view, as in the job controller this functions, get all the params that the user insert
    and save it.
=end
    def update
        puts "SI FUNCIONA MEJOR"
        @job = Job.find(params[:job_id])
        @application = @job.applications.find(params[:id])
        @application.update(application_params)
        redirect_to @job
    end

=begin 
    This function works like the destroy from Jobs, the difference is here we looking first the job and then we delete the 
    current application.
=end
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
