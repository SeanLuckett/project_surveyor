module MultiChoiceQuestionHelper
  def decorate_questions(questions)
    questions.map { |q| MultiQuestionDecorator.new(q) }
  end

  def selected_answer?(question, answer)
    if question.selected_answers
      question.selected_answers.include? answer.body
    end
  end
end