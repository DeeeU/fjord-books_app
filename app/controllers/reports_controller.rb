class ReportsController < ApplicationController
  before_action :set_report, only: %i[show edit update destroy]

  def index
    @reports = Report.all

  end

  def new
    @report = Report.new
  end

  def create
    @report =Report.new(report_params)
    if @report.save
      redirect_to reports_path
    else
      render 'new'
    end
  end

  def update
    if @report = Report.update(report_params)
      redirect_to reports_path
    else
      render 'edit'
    end
  end

  def edit
  end

  def show
  end

  private
  def set_report
    @report = Report.find(params[:id])
  end

  def report_params
    params.require(:report).permit(:title, :text)
  end
end
