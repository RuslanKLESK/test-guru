# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# Examples:
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts 'Seeding...'
puts 'Now! users...'
users = []
admin = User.create(name: 'admin', email: 'admin@test.ru', password: 'admin')
users << admin
user = User.create(name: 'user', email: 'user@test.ru', password: 'user')
users << user
10.times do
  u = User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 10, max_length: 20, mix_case: true, special_characters: true)
  )
  users << u
end
puts "users index 0 #{users[0]}, #{users[0].id}, #{users[0].name}, #{users[0].email} "
puts "users index 1 #{users[1]}, #{users[1].id}, #{users[1].name}, #{users[1].email} "
puts "users index 2 #{users[2]}, #{users[2].id}, #{users[2].name}, #{users[2].email} "
puts "users index 3 #{users[3]}, #{users[3].id}, #{users[3].name}, #{users[3].email} "
puts "users index 4 #{users[4]}, #{users[4].id}, #{users[4].name}, #{users[4].email} "
puts "users index 5 #{users[5]}, #{users[5].id}, #{users[5].name}, #{users[5].email} "
puts "users index 6 #{users[6]}, #{users[6].id}, #{users[6].name}, #{users[6].email} "
puts "users index 7 #{users[7]}, #{users[7].id}, #{users[7].name}, #{users[7].email} "
puts "users index 8 #{users[8]}, #{users[8].id}, #{users[8].name}, #{users[8].email} "
puts "users index 9 #{users[9]}, #{users[9].id}, #{users[9].name}, #{users[9].email} "
puts "users index 10 #{users[10]}, #{users[10].id}, #{users[10].name}, #{users[10].email} "
puts "users index 11 #{users[11]}, #{users[11].id}, #{users[11].name}, #{users[11].email} "
puts 'users + gem Faker is ok!'

puts 'Now! categories'
categories = Category.create!([
  {title: 'Frontend'},
  {title: 'Backend'},
  {title: 'Mobile Development'},
  {title: 'Machine learning'}
])

puts 'Now! tests'
tests = Test.create!([
  {title: 'HTML', level: 1, category_id: categories[0].id, user_id: users[0].id},
  {title: 'Ruby', level: 2, category_id: categories[1].id, user_id: users[0].id},
  {title: 'JavaScript', level: 3, category_id: categories[0].id, user_id: users[0].id},
  {title: 'GO', level: 5, category_id: categories[2].id, user_id: users[0].id},
  {title: 'Node', level: 4, category_id: categories[1].id, user_id: users[0].id},
  {title: 'Assembler', level: 8, category_id: categories[3].id, user_id: users[0].id} # for test level: 5..Float::INFINITY)
])

puts 'Now! questions'
questions = Question.create!([
  {body: 'Что такое HTML?', test_id: tests[0].id},
  {body: 'Какие основные виды списков применяют при создании веб-страницы?', test_id: tests[0].id},
  {body: 'Что такое прототип объекта?', test_id: tests[2].id},
  {body: 'Перечислите некоторые особенности Ruby?', test_id: tests[1].id},
  {body: 'Как создать объект Ruby?', test_id: tests[1].id}
])

puts 'Now! answers'
answers = Answer.create!([
  {title: 'Вариант к 1 вопросу(HTML)', correct: false, question_id: questions[0].id},
  {title: 'Вариант к 1 вопросу(HTML)', correct: false, question_id: questions[0].id},
  {title: 'Вариант к 1 вопросу(HTML)', correct: true, question_id: questions[0].id},
  {title: 'Вариант к 1 вопросу(HTML)', correct: false, question_id: questions[0].id},

  {title: 'Вариант к 2 вопросу(HTML)', correct: false, question_id: questions[1].id},
  {title: 'Вариант к 2 вопросу(HTML)', correct: false, question_id: questions[1].id},
  {title: 'Вариант к 2 вопросу(HTML)', correct: true, question_id: questions[1].id},
  {title: 'Вариант к 2 вопросу(HTML)', correct: false, question_id: questions[1].id},

  {title: 'Вариант к 3 вопросу(JavaScript)', correct: false, question_id: questions[2].id},
  {title: 'Вариант к 3 вопросу(JavaScript)', correct: false, question_id: questions[2].id},
  {title: 'Вариант к 3 вопросу(JavaScript)', correct: true, question_id: questions[2].id},
  {title: 'Вариант к 3 вопросу(JavaScript)', correct: false, question_id: questions[2].id},

  {title: 'Вариант к 4 вопросу(Ruby)', correct: false, question_id: questions[3].id},
  {title: 'Вариант к 4 вопросу(Ruby)', correct: false, question_id: questions[3].id},
  {title: 'Вариант к 4 вопросу(Ruby)', correct: true, question_id: questions[3].id},
  {title: 'Вариант к 4 вопросу(Ruby)', correct: false, question_id: questions[3].id},

  {title: 'Вариант к 5 вопросу(Ruby)', correct: false, question_id: questions[4].id},
  {title: 'Вариант к 5 вопросу(Ruby)', correct: false, question_id: questions[4].id},
  {title: 'Вариант к 5 вопросу(Ruby)', correct: true, question_id: questions[4].id},
  {title: 'Вариант к 5 вопросу(Ruby)', correct: false, question_id: questions[4].id}
])

puts 'Now! tests_users' # Заполнить данные для соединительной таблицы Tests_Users:
tests_users = TestsUser.create!([
  {user_id: users[3].id, test_id: tests[0].id}, 
  {user_id: users[3].id, test_id: tests[1].id}, 
  {user_id: users[3].id, test_id: tests[2].id}, 
  {user_id: users[4].id, test_id: tests[3].id}, 
  {user_id: users[4].id, test_id: tests[4].id},
  {user_id: users[4].id, test_id: tests[0].id}, 
  {user_id: users[5].id, test_id: tests[1].id},
  {user_id: users[6].id, test_id: tests[2].id}, 
  {user_id: users[7].id, test_id: tests[3].id},
  {user_id: users[8].id, test_id: tests[4].id},
  {user_id: users[9].id, test_id: tests[0].id},
  {user_id: users[10].id, test_id: tests[1].id},
  {user_id: users[11].id, test_id: tests[2].id} 
])
puts "Seeding done."
