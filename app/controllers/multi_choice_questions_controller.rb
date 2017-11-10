class MultiChoiceQuestionsController < ApplicationController
  def new
    render :new, locals: {
      question: MultiChoiceQuestion.new,
      survey: Survey.find(params[:survey_id])
    }
  end

  def create
    survey = Survey.find(params[:survey_id])
    question = MultiChoiceQuestion.new q_params.merge(survey_id: survey.id)

    if question.save
      redirect_to survey_path survey
    else
      render :new, locals: { survey: survey, question: question }
    end
  end

  def destroy
    q = MultiChoiceQuestion.find(params[:id])

    if q.destroy
      redirect_to survey_path q.survey.id
    else
      redirect_to :back
    end
  end

  def build_question
    question = MultiChoiceQuestion.new(q_params)
    params[:num_options].to_i.times do
      question.question_options.build
    end

    render :build_question,
           locals: {
             survey: Survey.find(params[:survey_id]),
             question: question
           }
  end

  private

  def q_params
    params
      .require(:multi_choice_question)
      .permit(:required, :multipart, :body,
              question_options_attributes: [:body])
  end

end
