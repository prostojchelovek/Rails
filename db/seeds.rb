# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

tests = Test.create!([
  {title: 'Ruby', level: 1, author: users[0], category: categories[0]},
  {title: 'Rails', level: 1, author: users[1], category: categories[1]},
  {title: 'HTML', author: users[2], category: categories[2]},
  {title: 'CSS', level: 1, author: users[5], category: categories[2]}
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

users = User.create!([
  {name: 'Oliver', password: '12345', login: 'human111'},
  {name: 'Jack', password: '1111', login: 'human223'},
  {name: 'Charlie', password: '15243', login: 'human313'},
  {name: 'Thomas', password: '54321', login: 'human444'},
  {name: 'Jacob', password: '112233', login: 'human521'},
  {name: 'Riley', password: '55555', login: 'human644'}
])

questions = Question.create!([
  {description: 'Какой тег для ссылок?', test: tests[2]},
  {description: 'Основная папка в Rails?', test: tests[1]},
  {description: 'Не является допустимым значением длины?', test: tests[3]},
  {description: 'Какого типа данных нет в Ruby?', test: tests[0]}
])

categories = Category.create!([
  {title: 'programming'},
  {title: 'web application'},
  {title: 'layout of the site'}
])

examinations = Examinations.create!([
  {user: users[2], test: tests[3]},
  {user: users[4], test: tests[2]},
  {user: users[1], test: tests[3]},
  {user: users[2], test: tests[0]}
])
