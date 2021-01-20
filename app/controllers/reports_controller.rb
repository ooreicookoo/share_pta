class ReportsController < ApplicationController
  def index
    @reports = Report.all
  end
  def new
    @report = Report.new
  end
  def create
    Report.create(report_params)
    redirect_to new_report_path
  end
  def show
    @report = Report.find(params[:id])
  end
  private
  def report_params
    params.require(:report).permit(:title, :content, :time, :date, :place, :image)
  end
end
