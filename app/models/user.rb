class User < ApplicationRecord
  # has_and_belongs_to_many :tests
  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :authors, class_name: 'Test', foreign_key: "test_id"

  scope :all_tests_of_user_by_level, -> (level) { tests.where(level: level) }

  validates :name, :email, :password, presence: true

end
