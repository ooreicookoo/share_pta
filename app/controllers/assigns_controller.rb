class AssignsController < ApplicationController

  def new
    @assign = Assign.new
  end

  def create
    @assign = current_user.assigns.build(assign_params)
    team = find_team(params[:team_id])
    user = current_user
      if @assign.save
        redirect_to team_path(team.id), notice: 'チームに参加しました'
      else
        render :new
      end
    end


  def show
  end

  private
  def assign_params
    params.require(:assign).permit(:emai, :team_id, :user_id)
  end

end
