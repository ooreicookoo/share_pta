class ReportCommentsController < ApplicationController
  before_action :set_report, only: [:create, :edit, :update]
  before_action :authenticate_user!
  def create
      @report_comment =  @report.report_comments.build(report_comment_params)
      # @report_comment.user_id = current_user.id
      respond_to do |format|
      if @report_comment.save!
        format.js { render :index }
      else
        format.html { redirect_to report_path(@report), notice: '投稿できませんでした...' }
      end
    end
  end

  def edit
    @report_comment = @report.report_comments.find(params[:id])
    respond_to do |format|
      flash.now[:notice] = 'コメントの編集中'
      format.js { render :edit }
    end
  end

  def update
    @report_comment = @report.report_comments.find(params[:id])
      respond_to do |format|
        if @report_comment.update(report_comment_params)
          flash.now[:notice] = 'コメントが編集されました'
          format.js { render :index }
        else
          flash.now[:notice] = 'コメントの編集に失敗しました'
          format.js { render :edit_error }
        end
      end
  end
  def destroy
    @report_comment = ReportComment.find(params[:id])
    @report_comment.destroy
    respond_to do |format|
      flash.now[:notice] = 'コメントが削除されました'
      format.js { render :index }
    end
  end

  private
  def report_comment_params
    params.require(:report_comment).permit(:report_id, :comment_content)
  end

  def set_report
    @report = Report.find(params[:report_id])
  end
end
