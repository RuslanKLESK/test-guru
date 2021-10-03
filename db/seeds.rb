# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create([
  {title: 'Frontend'},
  {title: 'Backend'},
  {title: 'Mobile Development'},
  {title: 'Machine learning'}
])

users = User.create([
  {name: 'user', email: 'user@test.ru', password: 'pass'},
  {name: 'admin', email: 'admin@test.ru', password: 'admin_pass'}
])

tests = Test.create([
  {title: 'HTML', level: 1, category_id: categories[0].id, user_id: users[0].id},
  {title: 'Ruby', level: 2, category_id: categories[1].id, user_id: users[0].id},
  {title: 'JavaScript', level: 2, category_id: categories[0].id, user_id: users[0].id},
  {title: 'GO', level: 3, category_id: categories[2].id, user_id: users[0].id},
  {title: 'Node', level: 2, category_id:  categories[1].id, user_id: users[1].id}
])

questions = Question.create([
  {body: 'Что такое HTML?', test_id: tests[0].id},
  {body: 'Какие основные виды списков применяют при создании веб-страницы?', test_id: tests[0].id},
  {body: 'Что такое прототип объекта?', test_id: tests[2].id},
  {body: 'Перечислите некоторые особенности Ruby?', test_id: tests[1].id},
  {body: 'Как создать объект Ruby?', test_id: tests[1].id}
])

Answer.create([
  {title: 'Вариант 1', question_id: questions[0].id},
  {title: 'Вариант 2', question_id: questions[0].id},
  {title: 'Вариант 3', correct: true, question_id: questions[0].id},
  {title: 'Вариант 4', question_id: questions[0].id}
])