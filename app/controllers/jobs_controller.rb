class JobsController < ApplicationController
    before_action :authenticate_user!, except: [:show, :index]

    def index
        if current_user.userType == false
            @jobs = Job.all 
            @accepts = Application.where(user: current_user).where(status: "aceptado")
            @pending = Application.where(user: current_user).where(status: ["pendiente", "rechazado"])
        else
            @jobs = Job.where(user: current_user)
        end
    end

    def show
        @job = Job.find(params[:id])
        @count = @job.applications.where(status: "aceptado").size
        # @userTries = @job.applications.where.not(status: "rechazado").where(user: current_user).size
        @userTries = @job.applications.where(user: current_user).size
    end

    def new
        @job = Job.new
    end

    def edit
        @job = Job.find(params[:id])
        if current_user != @job.user
            redirect_to @job
        end
    end

    def create
        @job = Job.new(job_params)
        @job.user = current_user

        if @job.save
            redirect_to @job
        else
            render 'new'
        end
    end

    def update
        @job = Job.find(params[:id])

        if @job.update(job_params)
            redirect_to @job
        else
            render 'edit'
        end
    end


    def destroy
        @job = Job.find(params[:id])
        @job.destroy

        redirect_to jobs_path
    end

    private
        def job_params
            params.require(:job).permit(:title, :description, :initDate, :endDate, :payment, :skills, :maxNumber)
        end
end
