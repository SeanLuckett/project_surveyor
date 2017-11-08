class SurveysController < ApplicationController
  def index
    render :index, locals: { surveys: Survey.all }
  end
end
