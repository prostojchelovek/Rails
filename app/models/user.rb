class User < ApplicationRecord
  def list_tests_by_level(level) #Создаю этот метод с расчетом на то, что в будущем у меня будет создана таблица examinations
    Test
      .joins("JOIN examinations ON examinations.user_id = #{id}") #Наверное, еще нужно будет соеденить все таблицы, чтобы моя БД стала
      .where("tests.level = :level", level: level)                #полноценной, но этого не было в задании, поэтому пока не стал делать
  end
end
