class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependet: :delete_all #Удаление вопроса повлечет за собой и удал. всех вар. ответа
end
