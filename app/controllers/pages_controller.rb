=begin
This is the controller for the static pages that the page have, as there is only static page
the don't have a lot of functionality
=end

class PagesController < ApplicationController
  # In rails every view has to have a function controller, but index is a static page, so the function 
  # is empty
  def index
  end

=begin 
  This function works every time the user push the button employee, they redirect to the job path
  and change the userType attribute from the user, if the user is looking for a job the value is 
  false, if the user is looking for employees, the value is true.
=end
  def employee
    # We save the current_user in a variable
    @user = current_user
    # Change the user type to false
    @user.userType = false
    # Every time that you made one modification you have to save.
    @user.save
    # Redirect to the jobs path where he can found every job that he wants
    redirect_to jobs_path
  end

=begin 
  All most the same with the employee function, but in this case we return a true, this two function
  are very important becuse, this attribute is the one we use to show the views depeding in what
  kind of user is using our app.
=end
  def employer
    # We save the current_user in a variable
    @user = current_user
    # Change the user type to true
    @user.userType =true
    # Save the changes
    @user.save
    # Redirect to jobs path where the user can see her jobs or make a new one
    redirect_to jobs_path
  end
end
