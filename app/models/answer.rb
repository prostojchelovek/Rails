class Answer < ApplicationRecord
  belongs_to :question

  validates :option, presence: true
  validate :limiting_responses

  scope :correct_answer, -> { where(correct: true) }

  private

  def self.limiting_responses
    errors.add(:option) if question.answers.count > 4
end
