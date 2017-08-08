class UsersController < Clearance::UsersController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @users = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end



  private
  def user_params
    params.require(:user).permit(:email, :password)
  end

  def url_after_create
    user_path(@user)
  end
end
