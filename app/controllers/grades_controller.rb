class GradesController < ApplicationController
  before_action :check_logged_in
  before_action :set_grade, only: [:show, :edit, :update, :destroy]


  def index
    @grades = Grade.all
  end

  def new
    @grade = Grade.new
  end

  def edit
  end

  def show
    redirect_to teachers_path
  end

  def create
    @grade = Grade.new(grade_params)
    respond_to do |format|
      if @grade.save
        format.html { redirect_to @grade, notice: 'Grade was successfully created.' }
        format.json { render :show, status: :created, location: @grade }
      else
        format.html { render :new }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  end

  private
  def check_logged_in
    redirect_to login_login_path unless session[:teacher_id]
  end

  private
  def grade_params
    params.require(:grade).permit(:student_email, :assignment_name, :due_on, :score)
  end

  def destroy
    @grade.destroy
    redirect_to teachers_path, notice: 'Grade was destroyed'
  end

  private
  def set_grade
    @grade = Grade.find(params[:id])
  end

end
