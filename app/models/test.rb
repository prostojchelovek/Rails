class Test < ApplicationRecord
  belongs_to :category
  has_many :question, :dependent: :nullify
  has_many :examinations, through: :users
  has_many :answers, through: :questions
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  def self.sort_by_category(category)
    joins('JOIN categories ON tests.category_id = categories.id')
      .where(categories: { title: category })
      .order(title: :desc)
      .pluck(:title)
  end
end
