# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create!([  #Вход для этих данных будет невозможным, т.к. пароли не шифруются SHA1 и в БД имеют
  {name: 'Oliver', password_digest: '12345', email: 'oliver@mail.ru'}, #ровно те же значения что и в seeds
  {name: 'Jack', password_digest: '1111', email: 'jack@mail.ru'},
  {name: 'Charlie', password_digest: '15243', email: 'charlie@mail.ru'},
  {name: 'Thomas', password_digest: '54321', email: 'thomas@mail.ru'},
  {name: 'Jacob', password_digest: '112233', email: 'jacob@mail.ru'},
  {name: 'Riley', password_digest: '55555', email: 'riley@mail.ru'}
])

categories = Category.create!([
  {title: 'programming'},
  {title: 'web application'},
  {title: 'layout of the site'}
])

tests = Test.create!([
  {title: 'Ruby', level: 1, author: users[0], category: categories[0]},
  {title: 'Rails', level: 1, author: users[1], category: categories[1]},
  {title: 'HTML', level: 2, author: users[2], category: categories[2]},
  {title: 'CSS', level: 1, author: users[5], category: categories[2]}
])

questions = Question.create!([
  {description: 'Какой тег для ссылок?', test: tests[2]},
  {description: 'Основная папка в Rails?', test: tests[1]},
  {description: 'Не является допустимым значением длины?', test: tests[3]},
  {description: 'Какого типа данных нет в Ruby?', test: tests[0]}
])

answers = Answer.create!([
  {correct: true, option: 'tag <a>', question: questions[0]},
  {option: 'tag <br>', question: questions[0]},
  {option: 'tag <p>', question: questions[0]},
  {correct: true, option: 'boolean', question: questions[3]},
  {option: 'integer', question: questions[3]},
  {option: ':name_var', question: questions[3]},
  {correct: true, option: 'dm', question: questions[2]},
  {option: 'em', question: questions[2]},
  {option: 'mm', question: questions[2]},
  {correct: true, option: 'app', question: questions[1]},
  {option: 'config', question: questions[1]},
  {option: 'public', question: questions[1]}
])
