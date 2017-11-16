class Take::SurveyTakersController < ApplicationController
  def show
    survey = Survey.includes(questions: [:question_options]).find(params[:id])
    survey_questions = survey.questions.map { |q| SurveyQuestion.new(q) }

    render :show, locals: { survey: survey, questions: survey_questions }
  end

  def record_answers
    survey = Survey
               .includes(questions: [:question_options])
               .find(params[:id])

    incomplete = false
    survey_questions = []

    params[:questions].each do |i, q_params|
      inquiry = SurveyQuestion.new(survey.questions.find_by body: q_params[:text])
      inquiry.selected_answers = q_params[:answers] if q_params[:answers]

      unless inquiry.question.required?
        survey_questions << inquiry
        next
      end

      if inquiry.selected_answers.nil?
        incomplete = true
        inquiry.error_msg = 'Please select a response'
      end

      survey_questions << inquiry
    end

    if incomplete
      render :show, locals: { survey: survey, questions: survey_questions }
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

  SurveyQuestion = Struct.new :question, :selected_answers, :error_msg
end