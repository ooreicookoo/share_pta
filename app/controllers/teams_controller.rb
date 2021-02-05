class TeamsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  def index
    @teams = Team.all
  end

  def new
    @team = Team.new

  end

  def create
    @team = Team.new(team_params)
    @team.owner = current_user
    # binding.pry
    if @team.save!
      redirect_to  teams_path, notice: 'チームを作成しました！'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @team.update(team_params)
      redirect_to teams_path, notice: "チーム名を編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @team.destroy
    redirect_to teams_path, notice:"チームを削除しました！"
  end

  def invite
    #サービスを利用していない人をに招待する機能
  end

  private
  def team_params
    params.require(:team).permit(:name, user_ids: [])
  end
  def set_team
    @team = Team.find(params[:id])
  end
end
