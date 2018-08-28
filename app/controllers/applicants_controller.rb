class ApplicantsController < ApplicationController
  before_action :authenticate_applicant!  
  def index
    @applicants = Applicant.all
  end

  def show
    @applicant = Applicant.find(params[:id])
    @favorite_blogs = @applicant.favorite_blogs
  end    
end
