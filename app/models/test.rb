class Test < ApplicationRecord
  belongs_to :category
  has_many :questions, dependet: :nullify
  has_many :examinations
  has_many :answers, through: :questions #Для получения списка всех вариантов ответа из этого теста

  def self.sort_by_category(category)
    joins('JOIN categories ON tests.category_id = categories.id')
    .where(categories: { title: category })
    .order(title: :desc)
    .pluck(:title)
  end
end
