class CourseSelections < ActiveRecord::Migration
  def up	
    create_table :course_selections do |t|
      t.belongs_to :user
      t.belongs_to :course
      t.datetime :assign_date
      t.timestamps
    end
  end

  def down
  end
end
