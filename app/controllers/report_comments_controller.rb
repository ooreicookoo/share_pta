class ReportCommentsController < ApplicationController
  def create
    @report_comment = ReportComment.new(report_comment_params)
    @report_comment.user_id = current_user.id
    if @report_comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end

  end

  private
  def report_comment_params
    params.require(:report_comment).permit(:report_content)
  end
end
