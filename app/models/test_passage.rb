class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :set_current_question

  def completed?
    current_question.nil?
  end

  def time_left
    (created_at + test.timer * 60 - Time.current).to_i
  end

  def time_is_up?
    time_left <= 0
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
      self.passed = succesfully?
      self.current_question = nil if time_is_up?
    end

    save!
  end

  def success_rate
    (100 * correct_questions.to_f / test.questions.count).round
  end

  def succesfully?
    success_rate >= 85
  end

   def number_current_question
     test.questions.count - other_questions.count
   end

  private

  def set_current_question
    self.current_question = next_question
  end

  def other_questions
    test.questions.order(:id).where('id > ?', current_question.id)
  end

  def next_question
    if current_question
      other_questions.first
    else
      test.questions.first
    end
  end

  def correct_answer?(answer_ids)
    #correct_answers.ids.sort == answer_ids.map(&:to_i).sort этим методом нельзя передавать пустые ответы
    correct_answers_count = correct_answers.count

    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
    correct_answers_count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct
  end
end
