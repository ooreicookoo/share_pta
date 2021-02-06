class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  PER = 10

  def index
    @reports = Report.all.order("id DESC").page(params[:page]).per(PER)
    user_signed_in?
      @user = User.find(current_user.id)
      @user = User.new
  end

  def new
    @report = Report.new
  end

  def create
    @report = current_user.reports.build(report_params)
      if params[:back]
        render :new
      else
      if @report.save
        redirect_to reports_path, notice: "レポートを作成しました！"
      end
    end
  end

  def show
    @total_time = current_user.reports.sum(:time)
    @report_comments = @report.report_comments
    @report_comment = @report.report_comments.build
    @report_comments = @report.report_comments.order(created_at: :asc)
  end

  def edit
  end

  def update
    if @report.update(report_params)
      redirect_to reports_path, notice: "レポートを編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @report.destroy
    redirect_to reports_path, notice:"レポートを削除しました！"
  end
  def confirm
    @report = current_user.reports.build(report_params)
    render :new if @report.invalid?
  end

  private
  def report_params
    params.require(:report).permit(:title, :content, :time,
                                   :date, :place, :image,
                                   :image_cache).merge(user_id: current_user.id)
  end

  def set_report
    @report = Report.find(params[:id])
  end

  def ensure_correct_user
    @report = Report.find_by(id:params[:id])
    if @report.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/reports")
    end
  end
end
