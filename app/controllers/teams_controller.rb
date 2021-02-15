class TeamsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_team, only: [:show, :edit, :update, :destroy, :invite, :invite_mail, :ensure_user]
  before_action :ensure_user, only: [:edit, :destroy, :show]

  def index
    @teams = Team.all.order(updated_at: :desc)
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    @team.owner = current_user
    if @team.save
      redirect_to teams_path, notice: 'チームを作成しました！'
    else
      render :new
    end
  end

  def show
    @members = @team.members
    @team.owner
  end

  def invite
  end

  def invite_mail
    # binding.irb
    InviteMailer.send_mail(@team, team_params[:email]).deliver
    redirect_to team_path(id: @team.id), notice: 'チームに招待するメールを送信しました'
  end

  def edit
  end

  def update
    if @team.update(team_params)
      redirect_to team_path, notice: "チーム名を編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @team.destroy
    redirect_to teams_path, notice:"チームを削除しました！"
  end


  private
  def team_params
    params.require(:team).permit(:name, :id, :owner_id, :email)
  end

  def set_team
    @team = Team.find(params[:id])
  end

  def ensure_user
      @members = @team.members
      @members.user_id != @current_user.id
            binding.irb
      flash[:notice] = "権限がありません"
      redirect_to teams_path
  end



  def assign_params
    params.permit(:id, :team_id, :user_id, :email)
  end
end
