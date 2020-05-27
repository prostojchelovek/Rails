class User < ApplicationRecord
  has_many :examinations, dependet: :delete_all

  def list_tests_by_level(level)
    Test
      .joins("JOIN examinations ON examinations.test_id = tests.id")
      .where(level: level, examinations: { user_id: id })
  end
end
