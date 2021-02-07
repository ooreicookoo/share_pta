class AssignsController < ApplicationController

  def index
  end

  def new
    @assign = Assign.new
  end

  def create
    @assign = current_user.reports.build(report_params)
      if params[:back]
        render :new
      else
      if @report.save
        redirect_to reports_path, notice: "レポートを作成しました！"
      end
    end

  end


end
