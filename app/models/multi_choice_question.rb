class MultiChoiceQuestion < ApplicationRecord
  belongs_to :survey
  has_many :question_options, inverse_of: :multi_choice_question, dependent: :destroy

  accepts_nested_attributes_for :question_options, reject_if: :all_blank
end
