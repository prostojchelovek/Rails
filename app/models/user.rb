class User < ApplicationRecord
  has_many :examinations, dependent: :destroy
  has_many :tests, through: :examinations
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id

  def list_tests_by_level(level)
    Test.where(level: level)
  end
end
