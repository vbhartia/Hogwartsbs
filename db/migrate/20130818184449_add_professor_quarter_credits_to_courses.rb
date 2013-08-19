class AddProfessorQuarterCreditsToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :professor, :string
    add_column :courses, :credits, :string
    add_column :courses, :term, :string
    add_column :courses, :quarter, :string
  end
end
