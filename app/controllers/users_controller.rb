class UsersController < ApplicationController

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "レポートを編集しました！"
      else
        render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :charge, :school_year, :school_class, :id)
  end

end
