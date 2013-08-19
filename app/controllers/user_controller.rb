class UserController < ApplicationController

	def all_users
		@all_users = User.all
	end

	def show
		course_count = current_user.courses.count

		if (course_count < 5)
			flash.alert = 'Sorry, but in order to view the courses that this person is enrolled in you must add your own courses'
			redirect_to :action => 'my_courses'
		else
			@user = User.find(params[:username])		
		end
	end

end
