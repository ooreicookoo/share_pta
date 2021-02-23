class ReportsController < ApplicationController
  before_action :set_team, only: [:new, :create, :edit, :update, :destroy, :confirm]
  before_action :set_report, only: [:edit, :update, :destroy]
  # before_action :ensure_correct_user, only: [:edit, :update, :destroy, :update]
  PER = 10

  def index
    user_signed_in?
    @user = User.find(current_user.id)
    @user = User.new
    @team = Team.find(params[:team_id])
    @reports = @team.assign_reports.order("id DESC").page(params[:page]).per(PER)
    @graphys = Report.graphy(reports: @reports)
    # @team = current_user.favorites.find_by(blog_id: @blog.id)
  end

  def new
    @team = Team.find(params[:team_id])
    @report = Report.new
    @report.team_id = @team.id
  end

  def create
    @report = current_user.reports.build(report_params)
    @report.team_id = @team.id
    if params[:back]
      render :new
    else
      if @report.save
        redirect_to team_reports_path(@report.team.id), notice: "レポートを作成しました！"
      else
        render :new
      end
    end
  end

  def show
    @report = Report.find(params[:id])
    @total_time = @report.user.sum_report_time
    @report_comments = @report.report_comments
    @report_comment = @report.report_comments.build
    @report_comments = @report.report_comments.order(created_at: :asc)
  end

  def edit
  end

  def update
    if @report.update(report_params)
      redirect_to team_reports_path(@team.id), notice: "レポートを編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @report.destroy
    redirect_to team_reports_path(@team.id), notice:"レポートを削除しました！"
  end

  def confirm
  # binding.irb
    @report = current_user.reports.build(report_params)
    render :new if @report.invalid?
  end

  private
  def report_params
    params.require(:report).permit(:title, :content, :time,
                                   :date, :place, :image,
                                   :image_cache, :team_id, :user_id)
  end

  def set_team
    @team = Team.find(params[:team_id])
  end

  def set_report
    @report = Report.find(params[:id])
  end

  # def ensure_correct_user
  #   redirect_to teams_path, notice: "権限がありません" if current_user.teams.find_by(id: @team.id).nil?
  #   # redirect_to teams_path, notice: "権限がありません" unless current_user.teams.select { |team| team.id == @team.id }.length == 1
  # end


  # def ensure_correct_user
  #   @report = Report.find_by(id:params[:id])
  #   if @report.user_id != @current_user.id
  #     flash[:notice] = "権限がありません"
  #     redirect_to("/reports")
  #   end
  # end
end




#     route
# view -> controller
#
# params
#
# 1. form -> view
# 2. URL -> route.rb
#
# http://localhost:3000/reports/:id/edit
# http://localhost:3000/reports/34/edit -> params = { id: 34 }
#
# http://localhost:3000/teams/:team_id/reports/:id/edit
# http://localhost:3000/teams/1/reports/34/edit -> params = { id: 34, team_id: 1 }
