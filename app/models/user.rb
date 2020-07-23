class User < ApplicationRecord
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages do
    def success
      where("test_passages.passed = ?", true)
    end

    def after_badge_issue(time_of_issue)
      where("test_passages.updated_at > ?", time_of_issue)
    end
  end
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id
  has_many :gists, dependent: :destroy
  has_many :received_awards, dependent: :destroy
  has_many :badges, through: :received_awards

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  def list_tests_by_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    is_a?(Admin)
  end
end
