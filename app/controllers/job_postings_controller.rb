class JobPostingsController < ApplicationController
  def index
    @job_postings = JobPosting.all
  end

  def show
    @job_posting = JobPosting.find(params[:id])
  end

  def new
    @job_posting = JobPosting.new
  end

  def create
  @job_posting = JobPosting.new(job_posting_params)

    if @job_posting.save
      redirect_to @job_posting, notice: "Job posting created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def job_posting_params
    params.require(:job_posting).permit(:title, :description, :department, :status)
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
