class User < ApplicationRecord
  has_many :examinations, dependent: :destroy
  has_many :tests, through: :examinations
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id

  validates :email, presence: true,
                    uniqueness: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create                  

  def list_tests_by_level(level)
    tests.where(level: level)
  end
end
