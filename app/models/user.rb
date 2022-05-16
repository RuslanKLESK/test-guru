class User < ApplicationRecord
  # has_and_belongs_to_many :tests
  has_many :tests_users
  has_many :tests, through: :tests_users

  def user_tests_for_level(level)
    Test.where(level: level).joins('JOIN tests_users ON tests_users.test_id = tests.id').where(tests_users: {user_id: id})
  end
end
