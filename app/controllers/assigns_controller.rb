class AssignsController < ApplicationController

  def new
    @team = Team.find(params[:team_id])
    @assign = Assign.new
  end

  def create
    @assign = current_user.assigns.build(assign_params)
    if @assign.save!
      redirect_to team_path(@assign.team.id), notice: 'チームに参加しました'
    else
      render :new
    end
  end

  def show
  end

  # ISSUE: what is permit
  private
  def assign_params
    params.permit(:id, :team_id, :user_id)
  end
end


# ISSUE: don't understand form_with
# WHAT:
# WHY: 
# HOW:
