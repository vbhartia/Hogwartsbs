class FixCourseColumn < ActiveRecord::Migration
  def up
  	remove_column :courses, :professor
  	remove_column :courses, :credits
  	remove_column :courses, :quarter

    add_column :courses, :quarter_credits, :string
    add_column :courses, :faculty, :string
  	add_column :courses, :code, :string
  	add_column :courses, :section, :string
  	add_column :courses, :day, :string
  	add_column :courses, :time, :string
  	add_column :courses, :location, :string

  end

  def down
  end
end
