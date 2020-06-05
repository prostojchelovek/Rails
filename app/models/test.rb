class Test < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :questions, dependent: :destroy
  has_many :examinations, dependent: :destroy
  has_many :users, through: :examinations

  validates :title, presence: true,
                    uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true,
                                    greater_than_or_equal_to: 1 }

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :sort_by_category (category) -> { joins(:categories)
                                            .where(categories: { title: category })
                                            .order(title: :desc) }

  def self.sort_by_category_return_array(category)
    sort_by_category(category).pluck(:title)
  end
end
