# frozen_string_literal: true

class ReportsController < ApplicationController
  before_action :set_report, only: %i[show update edit destroy]
  before_action :regular_user, only: %i[edit update destroy]

  def index
    @reports = Report.order(:id)
  end

  def show
    @report = Report.find(params[:id])
    @comments = @report.comments.includes(:user)
  end

  def new
    @report = Report.new
  end

  def edit; end

  def create
    @report = Report.new(**report_params, user_id: current_user.id)
    if @report.save
      redirect_to reports_url, notice: t('controllers.common.notice_create', name: Report.model_name.human)
    else
      render :new
    end
  end

  def update
    if @report.update(report_params)
      redirect_to reports_url
    else
      render :edit
    end
  end

  def destroy
    @report.destroy
    redirect_to reports_url, notice: t('controllers.common.notice_destroy', name: Report.model_name.human)
  end

  private

  def set_report
    @report = Report.find(params[:id])
  end

  def report_params
    params.require(:report).permit(:title, :text)
  end

  def regular_user
    @report = Report.find(params[:id])
    return unless @report.user.id != current_user.id

    redirect_to reports_url
  end
end
