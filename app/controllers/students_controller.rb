class StudentsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_admin!
  before_action :set_students
  
  def create
    @university = University.find(params[:university_id])
    @student = @university.students.create(params[:student].permit(:student_id))
    @student.save
    redirect_to university_path(@university)
  end

  def set_students
    @university = University.find(params[:university_id])
    @students = @university.students.page(params[:page])
  end
end
