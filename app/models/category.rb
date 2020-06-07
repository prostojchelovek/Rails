class Category < ApplicationRecord
  scope_default { order(title: :asc }

  has_many :tests, dependent: :nullify

  validates :title, presence: true

end
