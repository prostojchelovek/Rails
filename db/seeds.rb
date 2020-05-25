# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

tests = Test.create!([
{title: 'Ruby', level: 1},
{title: 'Rails', level: 1},
{title: 'HTML', level: 3},
{title: 'CSS'},
{title: 'Ruby', level: 2},
{title: 'Rails', level: 4},
{title: 'Rails', level: 2},
{title: 'Ruby', level: 3},
{title: 'HTML'},
{title: 'CSS', level: 1}])

answers = Answer.create!([
{correct: true, option: 'tag <a>'},
{option: 'tag <br>'},
{option: 'tag <p>'},
{correct: true, option: 'boolean'},
{option: 'integer'},
{option: ':name_var'},
{correct: true, option: 'dm'},
{option: 'em'},
{option: 'mm'},
{correct: true, option: 'app'},
{option: 'config'},
{option: 'public'}])

users = User.create!([
{name: 'Oliver', password: '12345', login: 'human111'},
{name: 'Jack', password: '1111', login: 'human223'},
{name: 'Charlie', password: '15243', login: 'human313'},
{name: 'Thomas', password: '54321', login: 'human444'},
{name: 'Jacob', password: '112233', login: 'human521'},
{name: 'Riley', password: '55555', login: 'human644'}])

questions = Question.create!([
{description: 'Какой тег для ссылок?'},
{description: 'Основная папка в Rails?'},
{description: 'Не является допустимым значением длины?'},
{description: 'Какого типа данных нет в Ruby?'}])

categories = Category.create!([
{title: 'programming'},
{title: 'web application'},
{title: 'layout of the site'}])
