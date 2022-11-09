class ReportsController < ApplicationController
  before_action :set_report, only: %i[show edit update destroy]

  def index
    @reports = Report.order(:id)
  end

  def new
    @report = Report.new
  end

  def show
    @report = Report.find(params[:id])
    @comment = @report.comments.new()
  end

  def create
    @report = Report.new(report_params)
    @report.created_by = current_user.id
    respond_to do |format|
      if @report.save
        format.html { redirect_to reports_url , notice: t('controllers.common.notice_create', name: Report.model_name.human) }
        format.json { render :index, status: :created, location: @report }
      else
        format.html {render :new}
        format.json {render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to reports_url }
        format.json { render :show, status: :ok, location: @report }
      else
        format.html { render :edit }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @report.destroy
    respond_to do |format|
      format.html { redirect_to reports_url, notice: t('controllers.common.notice_destroy', name: Report.model_name.human) }
      format.json { head :no_content }
    end
  end

  private

  def set_report
    @report = Report.find(params[:id])

  end

  def report_params
    params.require(:report).permit(:title, :text)
  end
end
