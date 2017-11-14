class Results::SurveyResultsController < ApplicationController
  def show
    survey = Survey.includes(questions: [:question_options]).find(params[:id])
    render :show, locals: { survey: survey }
  end
end