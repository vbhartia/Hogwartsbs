class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(resource)

  	flash.notice = 'You are successfully signed in! Please add your courses!'

  	my_courses_path

  end

end
