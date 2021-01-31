class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
    @assign << current_user
  end

  def create
    @team = Team.new(team_params)
    @team.owner = current_user
    if @team.save
      redirect_to  root_path, notice: 'チームを作成しました！'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def invite
    #サービスを利用していない人をに招待する機能
  end

  private
  def team_params
    params.require(:team). permit(:name, user_id: [])
  end
end
