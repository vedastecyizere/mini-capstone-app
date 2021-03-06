class UsersController < ApplicationController

  def new 
    render "new.html.erb"  
  end

  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
      )
    if user.save
      session[:user_id] = user.id 
      flash[:success] = "Dear #{user.name}, you have successfully created an account!"
      redirect_to "/"
    else 
      flash[:warning] = "Invalid Email or password"
      redirect to "/signup"
    end  
  end
end
