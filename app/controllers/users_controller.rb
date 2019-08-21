class UsersController < ApplicationController

  def show
      @user = User.find(params[:id])
  end


  def update
    @user = User.find(params[:id])
    # return redirect_to @place, status: :forbidden if @place.user != current_user

    @user.update_attributes(user_params)
    if @user.valid?
      redirect_to static_pages_profile_path
    else
      render :edit, status: :unprocessable_entity
    end
  end


  private

    def user_params
      params.require(:user).permit(:name, :avatar)
    end
end
