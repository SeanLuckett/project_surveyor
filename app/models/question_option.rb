class QuestionOption < ApplicationRecord
  belongs_to :multi_choice_question, inverse_of: :question_options

  validates :body, presence: true

  def picked
    self.picked_count += 1
    save
  end
end
