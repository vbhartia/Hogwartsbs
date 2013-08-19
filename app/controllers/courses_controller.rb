class CoursesController < ApplicationController

	def all_courses
		@all_courses = Course.all
	end

	def show

		course_count = current_user.courses.count

		if (course_count < 5)
			flash.alert = 'Sorry, but in order to view who\'s enrolled in, you must add your own courses.'
			redirect_to :action => 'my_courses'
		else
			@course = Course.find(params[:name])		
		end
	end

	def my_courses
	end

	def add
      
      if (current_user.courses.where(id: params[:course_id])).empty?
      	course_to_add = Course.find(params[:course_id])

	      if (current_user.courses << course_to_add)
	        flash.alert = '\'' + course_to_add.title + '\'' + ' Successfully Added'
	        redirect_to :action => 'my_courses'
	      end

      else
	      flash.alert = 'You are already enrolled in this course'
        	redirect_to :action => 'my_courses'

      end
  	end	

	def remove
		course_selection_to_remove = current_user.course_selections.where(course_id = params[:course_id]).first
		course_to_remove = current_user.course_selections.delete(course_selection_to_remove)
		
		flash.alert = '\'' + Course.find(params[:course_id]).title + '\'' + ' Removed from your courses'

		redirect_to :action => 'my_courses'
	end


end
