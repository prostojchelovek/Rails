class User < ApplicationRecord
  has_many :examinations, dependent: :destroy
  has_many :tests, through: :examinations
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id

  def list_tests_by_level(level)
    Test
      .joins("JOIN examinations ON examinations.test_id = tests.id")
      .where(level: level, examinations: { user_id: id })
  end
end
