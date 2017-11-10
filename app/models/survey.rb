class Survey < ApplicationRecord
  has_many :questions,
           class_name: 'MultiChoiceQuestion',
           dependent: :destroy

  validates :title, :description, presence: true
end
