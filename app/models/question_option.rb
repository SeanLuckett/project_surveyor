class QuestionOption < ApplicationRecord
  belongs_to :multi_choice_question, inverse_of: :question_options

  validates :body, presence: true
end
