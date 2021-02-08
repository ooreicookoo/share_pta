class AssignsController < ApplicationController

  def new
    @user = User.find(current_user.id)
    @team = Team.find(params[:team_id])
    @assign = Assign.new

  end

  def create
    @assign = current_user.assigns.build(assign_params)
    @user = User.find(current_user.id)
    if @assign.save!
      redirect_to team_path(@assign.team.id), notice: 'チームに参加しました'
    else
      render :new
    end
  end

  def show
  end

  private
  def assign_params
    params.permit(:id, :team_id, :user_id)
  end
end
