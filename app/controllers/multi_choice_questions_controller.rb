class MultiChoiceQuestionsController < ApplicationController
  def new
    render :new, locals: {
      question: MultiChoiceQuestion.new,
      survey: Survey.find(params[:survey_id])
    }
  end

  def build_question
    render :build_question,
           locals: {
             survey: Survey.find(params[:survey_id]),
             multipart: q_params[:multipart],
             required: q_params[:required],
             number_of_options: params[:num_options]
           }
  end

  private

  def q_params
    params.require(:multi_choice_question).permit(:required, :multipart, :body)
  end
end
