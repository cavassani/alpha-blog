class SessionsController < ApplicationController
  
  def new
    
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "login realizado com sucesso."
      redirect_to user_path(user)
    else
      flash.now[:danger] = "algo errado com as informações de login passadas."
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:success] = "Deslogou"
    redirect_to root_path
  end

end
