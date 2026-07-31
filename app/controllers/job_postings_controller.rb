class JobPostingsController < ApplicationController
  layout "admin"
  before_action :authenticate_user!

  permission :new, desc: "Access the new job posting form", auto_assign: ["Manager", "Super Admin"]
  permission :create, desc: "Create new job postings", auto_assign: ["Manager", "Super Admin"]
  permission :edit, desc: "Access the edit job posting form", auto_assign: ["Staff", "Manager", "Super Admin"]
  permission :update, desc: "Edit job postings", auto_assign: ["Staff", "Manager", "Super Admin"]
  permission :destroy, desc: "Delete job postings", key: "forms.delete", auto_assign: ["Super Admin"]

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

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def job_posting_params
    params.require(:job_posting).permit(:title, :description, :department, :status)
  end
end