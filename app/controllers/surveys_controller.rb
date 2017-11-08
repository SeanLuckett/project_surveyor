class SurveysController < ApplicationController
  def index
    render :index, locals: { surveys: Survey.all }
  end

  def new
    render :new, locals: { survey: Survey.new }
  end
end
