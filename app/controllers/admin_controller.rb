class AdminController < ApplicationController

	before_action :authenticate_admin_user

  def index
  	@users = User.all
  end

  def edit
  	@user = User.find_by(id: params[:id])
  	redirect_to admin_path, alert: "User not found" unless @user
  end

  def transactions
    @user = User.find_by(id: params['id'])
    filename = "#{@user.email.split('@')[0]}.xls"
    respond_to do |format|
      format.html
      format.xls { headers["Content-Disposition"] = "attachment; filename=\"#{filename}\"" }
    end
  end

  def all_transactions
    @transactions = Transaction.includes(:user).paginate(:page => params[:page], :per_page => params[:per_page] || 2)
    respond_to do |format|
      format.html
      format.xls { headers["Content-Disposition"] = "attachment; filename=allTransactions.xls" }
    end

  end


  def update
  	@user = User.find_by(id: params[:id])
    respond_to do |format|
	  	if @user && @user.update(user_params)
	      format.html { redirect_to admin_path, notice: 'Updated Successfully' }
	  	else
	    	format.html { render :edit }
	  	end
  	end
  end

  private

  def authenticate_admin_user
  	unless current_user && current_user.is_admin?
  		redirect_to root_path, alert: "You are not autherised to access this page!"
  	end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :dob, :ph, :is_active, :card, :pin)
  end
end
