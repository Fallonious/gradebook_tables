class ParentsController < ApplicationController
  before_action :check_logged_in

  def index
    @parents = Parent.all
    @grades = Grade.all
  end

  def new
    @parent = Parent.new
  end

  def edit
  end

  def create
    @parent = Parent.new(parent_params)
    respond_to do |format|
      if @parent.save
        format.html { redirect_to @parent, notice: 'Parent was successfully created.' }
        format.json { render :show, status: :created, location: @parent }
      else
        format.html { render :new }
        format.json { render json: @parent.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  end

  def show
    redirect_to teachers_path
  end

  private
  def check_logged_in
    redirect_to login_login_path unless session[:parent_id]|| session[:teacher_id]
  end

  private
  def parent_params
    params.require(:parent).permit(:name, :email, :child_name, :teacher_id, :password)
  end
end
