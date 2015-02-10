class AchievementsController < ApplicationController
  before_action :check_logged_in
  before_action :set_achievement, only: [:show, :edit, :update, :destroy]


  def index
    @achievements = Achievement.all
  end

  def new
    @achievement = Achievement.new
  end

  def edit

  end

  def edit_students
    @students = Student.all
  end

  def update_students
    @achievement.students = []
    params[:students].keys.each do |student_id|
      @achievement.students << Student.find_by_id(student_id)
    end
    redirect_to edit_students_achievement_path
  end


  def show
    redirect_to teachers_path
  end

  def create
    @achievement = Achievement.new(achievement_params)
    respond_to do |format|
      if @achievement.save
        format.html { redirect_to @achievement, notice: 'Achievement was successfully created.' }
        format.json { render :show, status: :created, location: @achievement }
      else
        format.html { render :new }
        format.json { render json: @achievement.errors, status: :unprocessable_entity }
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
  def achievement_params
    params.require(:achievement).permit(:student_email, :assignment_name, :due_on, :score)
  end

  def destroy
    @achievement.destroy
    redirect_to teachers_path, notice: 'Achievement was destroyed'
  end

  private
  def set_achievement
    @achievement = Achievement.find(params[:id])
  end

end
