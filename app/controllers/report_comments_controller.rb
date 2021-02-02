class ReportCommentsController < ApplicationController
  def create
      @report = Report.find(params[report_id])
      @report_comment =  @report.report_comments.build(report_comment_params)
      respond_to do |format|
        if @report_comment.save
          format.html { redirect_to report_path(@report)}
        else
          format.html { redirect_to report_path(@report), notice: '投稿できませんでした...' }
        end
      end
    end

    private

    def report_comment_params
      params.require(:report_comment).permit(:report_id, :content)
    end
  end
