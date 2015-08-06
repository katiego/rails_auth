class UsersController < ApplicationController
  def new
  	@user = User.new
    render :new
  end

  def create
  	user = User.new(user_params)
	if user.save
		session[:user_id] = user.id
		redirect_to "/profile"
	else 
		flash[:error] = user.errors.full_messages.join(" and ")
		redirect_to "/signup"
    # the line above can be refactored to use rails route helpers:
    # redirect_to user_path(user)
	end
  end

  def show
  	@user = User.find(session[:user_id])
    render :show
  end

  private
    def user_params
      params.require(:user).permit(:email, :password)
    end
end
