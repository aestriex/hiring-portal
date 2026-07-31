class SectionsController < ApplicationController
  layout "admin"
  
  before_action :authenticate_user!
  before_action :set_job_posting

  def new
    @section = @job_posting.sections.new
  end

  def create
    @section = @job_posting.sections.new(section_params)

    if @section.save
      redirect_to job_posting_path(@job_posting), notice: "Section added."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @section = @job_posting.sections.find(params[:id])
  end

  def update
    @section = @job_posting.sections.find(params[:id])

    if @section.update(section_params)
      redirect_to job_posting_path(@job_posting), notice: "Section updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @section = @job_posting.sections.find(params[:id])
    @section.destroy
    redirect_to job_posting_path(@job_posting), notice: "Section removed."
  end

  private

  def set_job_posting
    @job_posting = JobPosting.find(params[:job_posting_id])
  end

  def section_params
    params.require(:section).permit(:title, :position)
  end
end