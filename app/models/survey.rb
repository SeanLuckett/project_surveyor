class Survey < ApplicationRecord
  has_many :questions,
           class_name: 'MultiChoiceQuestion',
           dependent: :destroy

  validates :title, :description, presence: true

  def answer_count
    questions.joins(:question_options).sum(:picked_count)
  end
end
