class SessionsController < ApplicationController
  def new

  end

  def create
    user = Usuario.find_by_email(params[:email])

    if user != nil
      if user && (user.senha == params[:password])
        session[:user_id] = user.id
        redirect_to root_url, notice: "Logado!"
      end
    else
      flash.now[:alert] = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end
