=begin 
This is the controller class from Jobs, this class is the one that have all the logic work in the jobs views
in rails we have this function that work with every job's view.
=end
class JobsController < ApplicationController
=begin
    This action will start before any other function.
    We call heve the autthenticate_user function from devise in all the function in this class except 
    show and index, if the function return false, the user will redirect to the sign in page
=end
    before_action :authenticate_user!, except: [:show, :index]

=begin
    This is the index function fron the index view, in this case depending in what type of user is current using the page
    is what kind of information is going to see.
=end
    def index
        # If the user is employee he can see there application accepted, the pending applications and the list of all the availables jobs
        if current_user.userType == false
            # A Query from the model Job is equivalent to SELECT * FROM jobs WHERE jobStatus != "actual";
            @jobs = Job.all.where.not(jobStatus: "actual") 
            # A Query from the model Application is equivalent to SELECT * FROM applications WHERE user_id = current_user.id and status == "aceptado";
            @accepts = Application.where(user: current_user).where(status: "aceptado")
            # A Query equivalent to SELECT * FROM applications WHERE status in ("pendiente", "rechazado");
            @pending = Application.where(user: current_user).where(status: ["pendiente", "rechazado"])
        
        # If the user is employer we only show they jobs from him.
        else
            # A Query equivalent to SELECT * FROM jobs WHERE user_id == current_user.id;
            @jobs = Job.where(user: current_user)
        end
    end

=begin 
    This is the show function from the show view, this ViewController have the purpose to show one job description.
    If the user is a employee he can see the option to apply to the job, but if the user is employer he can see
    all the application and decide if he accept or not to the employees
=end
    def show
        @job = Job.find(params[:id])
        @count = @job.applications.where(status: "aceptado").size
        @userTries = @job.applications.where(user: current_user).size
    end

=begin
    This is the function to the ViewController, every time the employer make a new job this function is called, the only line
    that exists is in case that the user make a mistake, so he didin't have to write everything again.
=end
    def new
        @job = Job.new
    end

=begin
    This is from de ViewController edit, every time that user made a request, we recive an id that we use to looking for 
    the especific job with that id, this have the function to modify a exited job, from this function we add 
    a constrain to deny other user that are not the owner of that job to modify.
=end
    def edit
        @job = Job.find(params[:id])
        if current_user != @job.user
            redirect_to @job
        end
    end

=begin
    This function is calling from the new functions, it have the objective to get all the datas from the new work and save
    if the datas are correct the page redirect to the show of this new job, if the datas are incorrect the page is reload
    but saves with the current attibutes.
=end
    def create
        @job = Job.new(job_params)
        @job.user = current_user

        if @job.save
            redirect_to @job
        else
            render 'new'
        end
    end

=begin 
    This function have almost the same functionality as create, but this function is calling by the edit ViewController instead of
    new editController, this function have the objective to update the values from the current job that is chosen.
=end
    def update
        @job = Job.find(params[:id])

        if @job.update(job_params)
            redirect_to @job
        else
            render 'edit'
        end
    end


=begin
    This function have the objective of delete a job, this function is very dangerous, so it dont' have a View, this function
    can only calling as a button, so any user can't make dangerous thing with this.
=end
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
