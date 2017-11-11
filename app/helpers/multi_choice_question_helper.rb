module MultiChoiceQuestionHelper
  def decorate_questions(questions)
    questions.map { |q| MultiQuestionDecorator.new(q) }
  end
end