class User < ApplicationRecord
  # has_and_belongs_to_many :tests
  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :autors, class_name: 'Test', foreign_key: "test_id"

  def all_tests_of_user_by_level(level)
    tests.where(level: level) # :tests, through: :tests_users = joined two table + level from tests + users_id from tests_users as current object of user
  end
end
