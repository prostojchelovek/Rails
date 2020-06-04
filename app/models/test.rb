class Test < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :questions, dependent: :destroy
  has_many :examinations, dependent: :destroy
  has_many :users, through: :examinations

  def self.sort_by_category(category)
    joins(:categories)
      .where(categories: { title: category })
      .order(title: :desc)
      .pluck(:title)
  end
end
