class Category < ApplicationRecord
  has_many :tests, dependet: :nullify #Удаление категории не удаляет сам вопрос
end
