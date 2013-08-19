class Course < ActiveRecord::Base
  attr_accessible :title, :body
  has_many :course_selections
  has_many :users, :through=> :course_selections
end
