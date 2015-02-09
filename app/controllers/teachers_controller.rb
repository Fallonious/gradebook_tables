class TeachersController < ApplicationController
  before_action :check_logged_in


  def index
    @teachers = Teacher.all
    @grades = Grade.all
  end

  def new
    @teacher = Teacher.new
    @grade = Grade.new
  end

  def edit

  end

  def create

    @teacher = Teacher.new(teacher_params)

    respond_to do |format|
      if @teacher.save
        format.html { redirect_to @teacher, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @teacher }
      else
        format.html { render :new }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  end

  def show
    redirect_to teachers_path
  end

  def destroy
  end

  private
  def check_logged_in
    redirect_to login_login_path unless session[:teacher_id]
  end

  private
  def teacher_params
    params.require(:teacher).permit(:name, :email, :password)
  end


end
