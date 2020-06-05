class Category < ApplicationRecord
  has_many :tests, dependent: :nullify

  validates :title, presence: true

  scope_default { order(title: :asc }
end
