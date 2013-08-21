class CoursesController < ApplicationController

	before_filter :authenticate_user!

	def all_courses
		@all_courses = Course.all
	end

	def show

		course_count = current_user.courses.count

		if (course_count < 5)
			flash.alert = 'Sorry, but in order to view who is enrolled in "' + Course.find(params[:name]).title + '" you must add atleast 5 of your own courses.'
			redirect_to :action => 'my_courses'
		else
			@course = Course.find(params[:name])		
		end
	end

	def my_courses
	end

	def add
		flash_notice = ''


    if params[:courses].nil?
	  flash.alert = "You did not select any courses, please press the checkbox next to all of the courses you are registered for. Then press 'Add Selected Courses'"
      redirect_to :action => 'my_courses'
    
    else

      params[:courses].each_key do |key|
        
        course_to_add = Course.find(key)
        if (current_user.courses.where(id: key)).empty?

		  	if (current_user.courses << course_to_add)
		       flash_notice = flash_notice + ' \'' + course_to_add.title + '\'' + ' Successfully Added <br/>'
		  	end
		else
	  		flash_notice = flash_notice + ' You are already enrolled in ' + '\'' + course_to_add.title + '\' <br/>'
	  	end

	  end
	  
	  flash.alert = flash_notice
      redirect_to :action => 'my_courses'
    
    end
      
  	end	

	def remove
		course_to_remove = Course.find(params[:course_id])
		
		if (current_user.courses.delete(course_to_remove))

			flash.alert = '\'' + Course.find(params[:course_id]).title + '\'' + ' Removed from your courses'
			redirect_to :action => 'my_courses'
		else
			flash.alert = '\'' + Course.find(params[:course_id]).title + '\'' + ' Could not be deleted'
			redirect_to :action => 'my_courses'
		end
	end


end
