class Badge < ApplicationRecord
  has_many :received_awards, dependent: :destroy
  has_many :users, through: :received_awards
  
  validates :name, :picture, presence: true

end
