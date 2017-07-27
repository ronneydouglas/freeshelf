class UsersController < ApplicationController
   # before_action :correct_user,   only: [:edit, :update]

   def new
      @user = User.new
   end

   def create
      @user = User.new(user_params)
      if @user.save
         session[:user_id] = @user.id
         redirect_to books_path
      else
         redirect_to new_user_path
      end
   end

   def show
      @user = current_user
   end


   private
   def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)

   end

   # def correct_user
   #    @user = User.find(params[:id])
   #    redirect_to(books_path) unless @user == current_user
   # end

end
