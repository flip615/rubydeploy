class UsersController < ApplicationController
	before_action :authenticate, only: [:show]
  def index
  end

  def create
  	@find_user = User.find_by_email(user_params[:email])
  	if @find_user
  		flash[:errors] = ["That email address has been registered"]
  		return redirect_to :back
  	else
  		@user = User.new(user_params)
  		if @user.valid?
  			@user.save
  			session[:user_id] = @user.id
  			redirect_to "/bright_ideas/"
  		else	
  			flash[:errors] = @user.errors.full_messages
  			return redirect_to :back
  		end	
  	end
  end

  def show
  	@view_user = User.select("name, alias, email, id").find(params[:id])
  	
  end

  private
  	def user_params
  		params.require(:user).permit(:name, :alias, :email, :password, :password_confirmation)
  	end

  	def authenticate
  		if current_user
		            if params[:id] != current_user.id
			end
		else
			return redirect_to '/'
		end
   	 end
end
