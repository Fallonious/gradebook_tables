class StudentsController < ApplicationController
  before_action :check_logged_in

  def index
    @students = Student.all
    @achievements = Achievement.all
  end

  def edit_achievements
    @student = Student.find(params[:id])
    @achievements = Achievement.all
  end



  def update_achievements
    @student = Student.find(params[:id])
    @student.achievements = []
    params[:achievements].keys.each do |a|
      @student.achievements << Achievement.find(a)
    end
    redirect_to edit_achievements_student_path, notice: "student's achievements were updated"
  end


  def new
    @student = Student.new
  end

  def edit
  end

  def create
    @student = Student.new(student_params)
    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    if @student.update(student_params)
      redirect_to @student, notice: "Student was updated."
    else
      render :edit
    end
  end

  def show
    redirect_to teachers_path
  end

  private
  def check_logged_in
    redirect_to login_login_path unless session[:student_id] || session[:teacher_id]
  end

  private
  def student_params
    params.require(:student).permit(:name, :student_email, :teacher_id, :password)
  end
end
