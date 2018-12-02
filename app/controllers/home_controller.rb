class HomeController < ApplicationController

  before_action :authenticate_user!, except: [:index]


  def index
    redirect_to(admin_path, notice: "Welcome to admin panel") if current_user && current_user.is_admin?
  end


  def edit
    @user = current_user
  end


  def update
    respond_to do |format|
      if current_user.update(user_params)
        format.html { redirect_to home_edit_path, notice: 'Updated Successfully' }
      else
        format.html { render :edit }
        format.json { render json: current_user.errors, status: :unprocessable_entity }
      end
    end
  end




  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :dob, :ph)
  end

end
