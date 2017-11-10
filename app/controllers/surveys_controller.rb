class SurveysController < ApplicationController
  def index
    render :index, locals: { surveys: Survey.all }
  end

  def new
    render :new, locals: { survey: Survey.new }
  end

  def create
    survey = Survey.new survey_params
    if survey.save
      redirect_to survey
    else
      render :new, locals: { survey: survey }
    end
  end

  def show
    render :show, locals: { survey: Survey.find(params[:id]) }
  end

  def configure_question
    render :configure_question,
           locals: { survey: Survey.find(params[:survey_id]) }
  end

  def add_question
  end

  private

  def survey_params
    params.require(:survey).permit :title, :description
  end
end
