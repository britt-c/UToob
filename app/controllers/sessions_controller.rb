class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password_digest])
      sessions[:user_id] = @user.id
      redirect_to(roo_path, notic: "Logged in!")
    else
      flash[:alert] = "Invalid email or password"
      render(:new)
    end
  end

 def destroy
  session.clear
  cookies.clear
  redirect_to(root_path, notice: "logged out")
 end

end
