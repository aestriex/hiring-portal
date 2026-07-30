class QuestionsController < ApplicationController
  before_action :set_job_posting
  before_action :set_section

  def new
    @question = @section.questions.new
  end

  def create
    @question = @section.questions.new(question_params)

    if @question.save
      redirect_to job_posting_path(@job_posting), notice: "Question added."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @question = @section.questions.find(params[:id])
  end

  def update
    @question = @section.questions.find(params[:id])

    if @question.update(question_params)
      redirect_to job_posting_path(@job_posting), notice: "Question updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @question = @section.questions.find(params[:id])
    @question.destroy
    redirect_to job_posting_path(@job_posting), notice: "Question removed."
  end

  private

  def set_job_posting
    @job_posting = JobPosting.find(params[:job_posting_id])
  end

  def set_section
    @section = @job_posting.sections.find(params[:section_id])
  end

  def question_params
    params.require(:question).permit(:label, :question_type, :required, :options, :position)
  end
end