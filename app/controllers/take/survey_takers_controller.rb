class Take::SurveyTakersController < ApplicationController
  def show
    survey = Survey.includes(questions: [:question_options]).find(params[:id])
    render :show, locals: { survey: survey, questions: survey.questions }
  end

  def record_answers
    survey = Survey
               .includes(questions: [:question_options])
               .find(params[:id])

    incomplete = false
    submitted_questions = []

    params[:questions].each do |i, q_params|
      question = survey.questions.find_by body: q_params[:text]

      unless question.required?
        submitted_questions << question
        next
      end

      if q_params[:answers].nil?
        incomplete = true
        question.errors.add(:please, 'select a response')
      end

      submitted_questions << question
    end

    if incomplete
      render :show, locals: { survey: survey, questions: submitted_questions }
    else
      tally_answers(survey.questions)
      redirect_to root_path
    end

  end

  private

  def tally_answers(questions)
    params[:questions].each do |i, q_params|
      question = questions.find_by body: q_params[:text]

      unless q_params[:answers].nil?
        q_params[:answers].each do |a|
          question.question_options.find_by(body: a).picked
        end
      end
    end
  end
end