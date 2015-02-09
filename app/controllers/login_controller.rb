class LoginController < ApplicationController
  def login
    if request.post?
      if params[:type] == "Teacher"
        teacher = Teacher.find_by_email(params[:email])
        if teacher && teacher.authenticate(params[:password]) #check to make sure that teacher != nil
          session[:teacher_id] = teacher.id
          flash[:notice] = "Welcome!" #flash persists after a redirect
          redirect_to teachers_path
        else
          flash.now[:notice] = "Please re-enter credentials" #flash.now does not hang out after a redirect
        end
      elsif params[:type] == "Student"
        student = Student.find_by_student_email(params[:email])
        if student && student.authenticate(params[:password]) #check to make sure that teacher != nil
          session[:student_id] = student.id
          flash[:notice] = "Welcome!" #flash persists after a redirect
          redirect_to students_path
        else
          flash.now[:notice] = "Please re-enter credentials" #flash.now does not hang out after a redirect
        end
      else
        parent = Parent.find_by_email(params[:email])
        if parent && parent.authenticate(params[:password]) #check to make sure that teacher != nil
          session[:parent_id] = parent.id
          flash[:notice] = "Welcome!" #flash persists after a redirect
          redirect_to parents_path
        else
          flash.now[:notice] = "Please re-enter credentials" #flash.now does not hang out after a redirect
        end

      end
    end
  end

  def logout
    session[:teacher_id] = nil
    session[:student_id] = nil
    session[:parent_id] = nil
    redirect_to login_login_path
  end

  def changepassword
    if request.post?
      if session[:teacher_id]
        teacher = Teacher.find_by_id(session[:teacher_id])
        if teacher && teacher.authenticate(params[:old_password]) #check to make sure that teacher != nil
          Teacher.update(session[:teacher_id], :password => params[:new_password])
          redirect_to teachers_path
        else
          flash.now[:notice] = "Please double check your old password" #flash.now does not hang out after a redirect
        end
      elsif session[:student_id]
        student = Student.find_by_id(session[:student_id])
        if student && student.authenticate(params[:old_password]) #check to make sure that teacher != nil
          Student.update(session[:student_id], :password => params[:new_password])
          redirect_to students_path
        else
          flash.now[:notice] = "Please double check your old password" #flash.now does not hang out after a redirect
        end
      elsif session[:parent_id]
        parent = Parent.find_by_id(session[:parent_id])
        if parent && parent.authenticate(params[:old_password]) #check to make sure that teacher != nil
          Parent.update(session[:parent_id], :password => params[:new_password])
          redirect_to parents_path
        else
          flash.now[:notice] = "Please double check your old password" #flash.now does not hang out after a redirect
        end
      end
    end
  end
end
