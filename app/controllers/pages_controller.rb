class PagesController < ApplicationController
  layout "admin"
  before_action :authenticate_user!

  def dashboard
    @job_postings = JobPosting.all
  end
end