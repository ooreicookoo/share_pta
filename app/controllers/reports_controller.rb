class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]
  def index
    @reports = Report.all
  end
  def new
    @report = Report.new
  end
  def create
    @report = Report.new(report_params)
      if @report.save
        redirect_to reports_path, notice: "レポートを作成しました！"
      else
        render :new
      end
  end
  def show
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
    @report = Report.new(report_params)
  end
  private
  def report_params
    params.require(:report).permit(:title, :content, :time, :date, :place, :image)
  end
  def set_report
    @report = Report.find(params[:id])
  end
end
