# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

# Таблицу User заменю на Faker, чтобы попробоать использование гема
#users = User.create([
#  {name: 'user', email: 'user@test.ru', password: 'pass'},
#  {name: 'admin', email: 'admin@test.ru', password: 'admin_pass'}
#])
puts 'Seeding...'
admin = User.create([
  {name: 'admin', email: 'admin@test.ru', password: 'admin'} # Архитектор всех Тестов, права уровень Администртор
]) 
testuser = User.create([
  {name: 'user', email: 'user@test.ru', password: 'user'} # Тестовый пользователь, права уровень Пользователь
])
5.times do
  users = User.create([{
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 10, max_length: 20, mix_case: true, special_characters: true)
  }])
end
puts 'gem faker is ok!'
# Faker::ProgrammingLanguage.name #=> "Ruby"
# Faker::ProgrammingLanguage.creator #=> "Yukihiro Matsumoto"
# Faker::PhoneNumber.cell_phone #=> "(186)285-7925"
# Faker::Number.number(digits: 10) #=> 1968353479
# Faker::Name.name_with_middle #=> "Aditya Elton Douglas"
# Faker::Internet.user('username', 'email', 'password') #=> { username: 'alexie', email: 'alexie@example.net', password: 'DtEf9P8wS31iMyC' }
# Faker::Internet.password(min_length: 10, max_length: 20, mix_case: true, special_characters: true) #=> "*%NkOnJsH4"
sleep 1

puts 'Now! categories'
categories = Category.create([
  {title: 'Frontend'},
  {title: 'Backend'},
  {title: 'Mobile Development'},
  {title: 'Machine learning'}
])
sleep 1

puts 'Now! tests'
tests = Test.create([
  {title: 'HTML', level: 1, category_id: categories[0].id, user_id: 1}, #., user_id: users[0].id} - удалил, так как это в соединительной таблице нужно указывать
  {title: 'Ruby', level: 2, category_id: categories[1].id, user_id: 1},
  {title: 'JavaScript', level: 2, category_id: categories[0].id, user_id: 1},
  {title: 'GO', level: 3, category_id: categories[2].id, user_id: 1},
  {title: 'Node', level: 2, category_id: categories[1].id, user_id: 1}
])
sleep 1

puts 'Now! questions'
questions = Question.create([
  {body: 'Что такое HTML?', test_id: tests[0].id},
  {body: 'Какие основные виды списков применяют при создании веб-страницы?', test_id: tests[0].id},
  {body: 'Что такое прототип объекта?', test_id: tests[2].id},
  {body: 'Перечислите некоторые особенности Ruby?', test_id: tests[1].id},
  {body: 'Как создать объект Ruby?', test_id: tests[1].id}
])
sleep 1

puts 'Now! answers'
answers = Answer.create([
  {title: 'Вариант к 1 вопросу(HTML)', question_id: questions[0].id},
  {title: 'Вариант к 1 вопросу(HTML)', question_id: questions[0].id},
  {title: 'Вариант к 1 вопросу(HTML)', correct: true, question_id: questions[0].id},
  {title: 'Вариант к 1 вопросу(HTML)', question_id: questions[0].id},

  {title: 'Вариант к 2 вопросу(HTML)', question_id: questions[1].id},
  {title: 'Вариант к 2 вопросу(HTML)', question_id: questions[1].id},
  {title: 'Вариант к 2 вопросу(HTML)', correct: true, question_id: questions[1].id},
  {title: 'Вариант к 2 вопросу(HTML)', question_id: questions[1].id},

  {title: 'Вариант к 3 вопросу(JavaScript)', question_id: questions[2].id},
  {title: 'Вариант к 3 вопросу(JavaScript)', question_id: questions[2].id},
  {title: 'Вариант к 3 вопросу(JavaScript)', correct: true, question_id: questions[2].id},
  {title: 'Вариант к 3 вопросу(JavaScript)', question_id: questions[2].id},

  {title: 'Вариант к 4 вопросу(Ruby)', question_id: questions[3].id},
  {title: 'Вариант к 4 вопросу(Ruby)', question_id: questions[3].id},
  {title: 'Вариант к 4 вопросу(Ruby)', correct: true, question_id: questions[3].id},
  {title: 'Вариант к 4 вопросу(Ruby)', question_id: questions[3].id},

  {title: 'Вариант к 5 вопросу(Ruby)', question_id: questions[4].id},
  {title: 'Вариант к 5 вопросу(Ruby)', question_id: questions[4].id},
  {title: 'Вариант к 5 вопросу(Ruby)', correct: true, question_id: questions[4].id},
  {title: 'Вариант к 5 вопросу(Ruby)', question_id: questions[4].id}
])
sleep 1

puts 'Now! tests_users'
# Заполнить данные для соединительной таблицы Tests_Users:
tests_users = TestsUser.create([
  {user_id: 3, test_id: 1}, # {user_id: users[3].id, test_id: tests[1].id},
  {user_id: 3, test_id: 2}, # {user_id: users[3].id, test_id: tests[2].id},
  {user_id: 3, test_id: 3}, # {user_id: users[3].id, test_id: tests[3].id},
  {user_id: 3, test_id: 4}, # {user_id: users[3].id, test_id: tests[4].id},
  {user_id: 3, test_id: 5}, # {user_id: users[3].id, test_id: tests[5].id},
  {user_id: 4, test_id: 1}, # {user_id: users[4].id, test_id: tests[1].id},
  {user_id: 4, test_id: 2}, # {user_id: users[4].id, test_id: tests[2].id},
  {user_id: 4, test_id: 3}, # {user_id: users[4].id, test_id: tests[3].id},
  {user_id: 4, test_id: 4}, # {user_id: users[4].id, test_id: tests[4].id},
  {user_id: 4, test_id: 5}, # {user_id: users[4].id, test_id: tests[5].id},
  {user_id: 5, test_id: 2}, # {user_id: users[5].id, test_id: tests[2].id},
  {user_id: 6, test_id: 5}, # {user_id: users[6].id, test_id: tests[5].id},
  {user_id: 7, test_id: 3}  # {user_id: users[7].id, test_id: tests[3].id}
])
  #  {title: 'GO', level: 3, category_id: categories[2].id, user_id: users[0].id},
  #  {title: 'Node', level: 2, category_id:  categories[1].id, user_id: users[1].id}
sleep 1
puts "Seeding done."
sleep 2
puts "Mission complete."
sleep 1
