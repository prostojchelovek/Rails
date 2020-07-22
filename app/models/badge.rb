class Badge < ApplicationRecord
  RULES = %w[category level first_attempt].freeze

  has_many :received_awards, dependent: :destroy
  has_many :users, through: :received_awards

  validates :name, :picture, presence: true
  validates :rule, inclusion: { in: RULES }, uniqueness: { scope: :parameter }

end
