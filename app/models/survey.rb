class Survey < ApplicationRecord
  validates :title, :description, presence: true
end
