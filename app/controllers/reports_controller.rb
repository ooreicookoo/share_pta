class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  def index
    @reports = Report.all  # allのあとにつける？.order(created_at: 'desc')
    if user_signed_in?
      @user = User.find(current_user.id)
    else
      redirect_to new_user_registration_path
    end
  end

  def new
    @report = Report.new
  end

  def create
    @report = current_user.reports.build(report_params)
    if @report.save
      redirect_to reports_path, notice: "レポートを作成しました！"
    else
      flash.now[:denger] = '投稿に失敗しました。内容が未記入です'
      render :new
    end
  end

  def show
    @report_comments = @report.report_comments
    @report_comment = ReportComment.new
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
    if @report.invalid?
      flash.now[:danger] = 'エラー！内容が未記入です'
      render :new
    end
  end
  private
  def report_params
    params.require(:report).permit(:title, :content, :time, :date, :place, :image, :image_cache)
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
