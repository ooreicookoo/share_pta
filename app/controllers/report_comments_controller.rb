def create
    @report = Report.find(params[:report_id])
    # @comment = @post.comments.create(params[:comment])
    @report_comment = @report.report_comments.create(report_comment_params)
    redirect_to report_path(@report)
  end

  def destroy
    @report = Report.find(params[:report_id])
    @report_comment = @report.report_comments.find(params[:id])
    @report_comment.destroy
    redirect_to report_path(@report)
  end

  private
  def report_comment_params
    params.require(:report_comment).permit(:body, :report_commenter)
  end
